unless window.location.host.match(/smile/)
  window.location = 'https://smile.amazon.com' + window.location.pathname

if (reviews = $("#customerReviews")).length
  reviews.insertAfter(".bucketDivider:first")

style '.amabot_right, #nav-ad-background-style, #gwcswA', 'visibility:hidden;'
