require 'pony'

@username = 'andre'
@text_area = 'Hello'

Pony.mail(
  to:      'andrewgavrick@yandex.ru',
  via:     :smtp,
  via_options: { 
    address:              'smtp.gmail.com', 
    port:                 '587', 
    enable_starttls_auto: true,
    user_name:            'cooladnrey98@gmail.com', 
    password:             'isodon48', 
    authentication:       'plain', 
    domain:               'gmail.com'
  })