class MemoCreateCommand

  attr_reader :user_id
  def initialize( user_id )
    @user_id = user_id
  end

  def exec!( params )
    entry_params = build_nested_params(params)
    e = Entry.create( entry_params )
  end

  def build_nested_params( params )
    default_tags = ['%default']
    all_tags = default_tags + params.delete(:tags).to_a
    exist_tags = Tag.where(
      user_id: user_id,
      name: all_tags
    )
    new_tags = all_tags - exist_tags.map(&:name)

    tags_attributes = new_tags.map.with_index {|tag_name,i|
      [ i, { user_id: user_id, name: tag_name } ]
    }.to_h
    tags_entries_attributes = exist_tags.map(&:id).map.with_index{|tag_id,i|
      [ i, { tag_id: tag_id } ]
    }.to_h

    {
      user_id: user_id, 
      kind: :memo,
      memo_attributes: params,
      tags_entries_attributes: tags_entries_attributes,
      tags_attributes: tags_attributes
    }
  end
end
