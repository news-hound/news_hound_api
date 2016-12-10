messages = [
  "is less than 2 old - most legitimate news sources have been around much longer",
  "may be operated by a single person, not an organization",
  "contains a misleading domain - it may not be the organization you think it is"
]

json.concepts []
json.blacklists []
json.ai do
  json.score Random.rand(1..100)
  json.messages messages.sample(Random.rand(1..3))
end
