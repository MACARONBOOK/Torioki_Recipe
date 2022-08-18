class Notification < ApplicationRecord
  # 作成日時の降順で絞り込み
  default_scope -> { order(created_at: :desc) }
  belongs_to :recipe, optional: true
  belongs_to :comment, optional: true
  belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  # ブックマークされていない場合のみ、通知レコード作成
  def create_bookmark_notification(current_user, user_id, id)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and recipe_id = ? and action = ? ", current_user.id, user_id, id, "bookmark"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        recipe_id: id,
        visited_id: user_id,
        action: "bookmark"
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # 自分以外のコメントしている人を取得し、全員に通知を送る
  def create_comment_notification(current_user, comment_id, user_id, recipe_id)
    temp_ids = Comment.select(:user_id).where(recipe_id: recipe_id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_comment_notification(current_user, comment_id, temp_id["user_id"], recipe_id)
    end
    save_comment_notification(current_user, comment_id, user_id, recipe_id) if temp_ids.blank?
  end


  # １つの投稿に対して複数回通知を送る
  def save_comment_notification(current_user, comment_id, visited_id, recipe_id)
    notification = current_user.active_notifications.new(
      article_id: recipe_id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: "comment"
    )

    # 自分の投稿に対するコメントは通知済扱い
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
