require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = create(:user)
    @post = @user.posts.create(content: "This is a test post for the current user")
  end

  describe "validations for the comments model" do
    it { is_expected.to validate_presence_of(:content) }
  end

  context "Testing the associations of the comments model" do
    describe "The comment should belong to the User model" do
      it { should belong_to(:user) }    
    end
        
    describe "The comment should belong to the Post model" do
      it { should belong_to(:post) }
    end
  end

  context "When creating a new comment" do
    describe "Testing the Post length" do
      it "Comment cannot be empty" do
        empty_comment = build(:comment, content: "")

        expect(empty_comment.valid?).to eq false
      end

      it "Comments cannot be more than 200 characters long" do
        long_comment = build(:comment, content: "a"*201)

        expect(long_comment.valid?).to eq false
      end
    end
  end
end