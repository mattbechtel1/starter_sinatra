Article.destroy_all
Contributor.destroy_all
ContributorEdit.destroy_all

article1 = Article.create(title: "Curacao Uprising of 1969", content: "There was an uprising and stuff happened")
article2 = Article.create(title: "Ruby", content: "Ruby is a programming language")
contributor1 = Contributor.create(username: "flatiron")
contributor2 = Contributor.create(username: "whtieboard")


ContributorEdit.create(article_id: article1.id, contributor_id: contributor1.id)
ContributorEdit.create(article_id: article2.id, contributor_id: contributor2.id)