# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSubmissions::ProcessFile, type: :service do
  describe ".call" do
    context "when process user files" do
      before { create(:object_type, :objects_type_list) }

      it "shoud save the contents of the inp file in the import table" do
        user_submission = create(:user_submission)

        described_class.call(user_submission.files.first, user_submission)

        expect(Import.all.count).to eq 1
      end

      it "shoud save objects present in the inp file separately in the object item table" do
        user_submission = create(:user_submission)

        described_class.call(user_submission.files.first, user_submission)

        expect(ObjectItem.all.count).to eq 765
      end
    end
  end
end
