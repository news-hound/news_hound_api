# 'snopes' => 1
# real or satire => 2
# politicafe => 3

Lens.create! [
  {name: 'Snopes', password: 'password'},
  {name: 'Real Or Satire', password: 'password'},
  {name: 'Politicaft', password: 'password'}
]

Article.create! [
  {
    url: "http://realorsatire.com/realnewsrightnow-com/",
    lens_id: 1
  }, {
    url: "http://realorsatire.com/thenationalsun-com/",
    lens_id: 1
  }, {
    url: "http://realorsatire.com/abcnews-com-co/",
    lens_id: 1
  }
]

Domain.create! [
  {name: 'realnewsrightnow.com'},
  {name: 'motivatornews.com'},
  {name: 'thenationalsun.com'},
  {name: 'abcnews.com.co'},
  {name: 'nationalreport.net'},
  {name: 'worldnewsdailyreport.com'},
  {name: 'empirenews.net'},
  {name: '16inchcity.com'}
]

# Snopes
Lens.find(1).concepts.create! [
  {
    keywords: ["obama", "pledge", "allegiance"],
    message: "Obama never banned the pledge. This story is a hoax."
  }, {
    keywords: ["hillary", "fbi"],
    message: "This story is a hoax. It has no real sources."
  }
]

# Snopes
Lens.find(1).blacklists.create! [
  {
    rebuttal_id: 1,
    domain_id: 1,
    message: "Anyone who knows a bit of journalism history — or has perhaps an unhealthy obsession with Hayden Christensen — would catch the \"Stephen Glass\" reference. So winning an award with the name Stephen Glass Distinction in Journalistic Integrity is basically admitting that you’re making shit up"
  }, {
    domain_id: 2,
    message: "Motivator News was started by the same fella (Paul Horner) who started the satirical news site National Report"
  }, {
    rebuttal_id: 2,
    domain_id: 3,
    message: "Their own disclaimer: The National Sun is a news satire and parody publication. All articles contained within this website, however similar to real events, are fictitious"
  }, {
    rebuttal_id: 3,
    domain_id: 4,
    message: "On their About page, they have the address and phone number for the Westboro Baptist Church hatemongers, which we find deliciously funny"
  }, {
    domain_id: 5,
    message: "Their own disclaimer: National Report is a news and political satire web publication, which may or may not use real names, often in semi-real or mostly fictitious ways"
  }, {
    domain_id: 6,
    message: "Their own disclaimer: All characters appearing in the articles in this website – even those based on real people – are entirely fictional"
  }, {
    domain_id: 7,
    message: "Their own disclaimer: Empire News is a satirical and entertainment website"
  }, {
    domain_id: 8,
    message: "A clearly satirical site"
  }
]

  # Real or Satire
Lens.find(2).blacklists.create! [
  {
    domain_id: 4,
    message: "This is not the real ABC news. They are trolling you."
  }
]
