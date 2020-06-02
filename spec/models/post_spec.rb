require 'rails_helper.rb'

RSpec.describe Post, type: :model do
    describe "validations for the posts model" do
        it { is_expected.to validate_presence_of(:content) }
    end

    context "Testing the scopes" do
        describe " .ordered_by_most_recent scope" do
            it 'returns a list of chronologically ordered list of posts' do
                new_post = create(:post)
                create(:post, :old)

                expect(described_class.ordered_by_most_recent.first).to eq new_post
            end
        end
    end

    context 'When creating a new post' do
        describe 'When creating a new post' do
            it 'Post should not be empty' do
                empty_post = build(:post, content: '')

                expect(empty_post.valid?).to eq false
            end

            it 'The Post should not be more than 1000 characters long' do
                long_post = build(:post, content: 'a'*1001)

                expect(long_post.valid?).to eq false
            end
        end
    end
end