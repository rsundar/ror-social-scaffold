require 'rails_helper'

RSpec.describe Like, type: :model do
  context "user can like single post only once" do
    let(:user) { create(:user) }
    let(:post) { user.posts.create(content: "this is a test post") }

    it "doesn't increase the number of likes for a single post from the same user" do
      user.likes.create(post: post)
      expect(post.likes.count).to eq(1)
      user.likes.create(post: post)
      expect(post.likes.count).to_not eq(2)
      expect(post.likes.count).to eq(1)
    end
  end
end
