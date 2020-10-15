--Models--

User
has_many :logs
has_many :medicines
has_many :articles
email:string
password_digest:string
name:string
affliction:string 

Log
belongs_to :user
user_id:integer
date:date
notes:text
medicine:string
symptomlevel:integer

Medicine
belongs_to :user
user_id:integer
name:string
description:string
notes:text

Stretch Goals

scrape
<!-- Article
belongs_to :user
user_id:integer
title:string
link:string
notes:string -->



