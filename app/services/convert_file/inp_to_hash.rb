# frozen_string_literal: true

module ConvertFile
  class InpToHash < ApplicationService
    attr_reader :inp_file, :objects, :user_submission

    FILE_SPLIT_REGEX = /\s*\.{2}\n\n*/
    EXTRACT_GROUPS_REGEX = /"(.+)"\s+=\s+([^\n]*)\n*\s*(.+)?/m

    def initialize(inp_file, user_submission)
      super()
      @inp_file = inp_file
      @user_submission = user_submission
      @objects = []
    end

    def call
      process_inp_file

      @objects
    end

    private

    def generate_json
      objects.to_json
    end

    def process_inp_file
      dowloaded_file = inp_file.download

      dowloaded_file.split(FILE_SPLIT_REGEX).each do |file_section|
        name, object, properties = file_section.match(EXTRACT_GROUPS_REGEX).captures
        properties =  properties ? format_properties(properties) : {}

        objects << { name: name,
                     object_type: get_object_type(object),
                     user_submission: user_submission,
                     properties: { name.to_s => object.to_s }.merge(properties) }
      end
    end

    def get_object_type(object)
      ObjectType.find_by(name: object) || ObjectType.last
    end

    def format_properties(properties)
      to_hash(clean_array(generate_array(split_properties(properties))))
    end

    def split_properties(elements)
      elements.split("\n")
    end

    def generate_array(elements)
      elements.map { |x| x.split("=", 2).map(&:strip) }
    end

    def clean_array(elements)
      elements.map! { |x| [x[0], x[1].gsub(/^\s*"|"\s*$/, "").gsub(/^\s+|\s+$/, "")] }
    end

    def to_hash(elements)
      elements.to_h
    end
  end
end
