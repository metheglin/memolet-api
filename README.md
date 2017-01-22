# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* How to run on local

```
bundle exec puma -e development -b unix://tmp/sockets/puma.sock
bundle exec puma -e development -b unix://tmp/sockets/puma.sock --daemon
```

* Manual User Create

```
user = User.create!(
  email: "user@youremail.com"
)
tag = Tag.create!(
  user_id: 1, 
  name: "tag_test"
)

e = Entry.create!( 
  user_id: 1, 
  kind: :memo,
  memo_attributes: {
    content: "bushi"
  },
  tags_attributes: {
    "0" => {
      user_id: 1,
      name: "super"
    }
  }
)
m = MemoCreateCommand.new(1).exec!(
  content: "aaabbb",
  tags: ["super", "orange", "dragonfruit"]
)
```

* Get Resources

```
# curl -H "Authorization: Token 0f3a2f8566c845c7a5df62075c2de687" \
#   "http://localhost:3000/v1/memo_pads"
# 
# curl -x POST \
#   -H "Authorization: Token 0f3a2f8566c845c7a5df62075c2de687" \
#   "http://localhost:3000/v1/memo_pads" \
#   -F "title=test"

curl -x POST \
  -H "Authorization: Token 0f3a2f8566c845c7a5df62075c2de687" \
  "http://localhost:3000/v1/memos" \
  -F "content=test" \
  -F "tags[]=tag_test" \
  -F "tags[]=tag_test2"
```
