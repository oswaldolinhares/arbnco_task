# frozen_string_literal: true

class ObjectItemsController < ApplicationController
  def index
    @import = Import.find(params[:import_id])
    @object_items = @import.object_items
  end

  def show
    @import = Import.find(params[:import_id])
    @object_item = ObjectItem.find(params[:id])
  end
end
