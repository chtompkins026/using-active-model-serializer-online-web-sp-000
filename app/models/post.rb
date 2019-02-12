# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#

class Post < ActiveRecord::Base
  belongs_to :author
  
   def show
    @post = Post.find(params[:id])
    render json: @post.to_json(only: [:title, :description, :id],
                              include: [author: { only: [:name]}])
  end

end
