OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '601194206718384', '0e5801b38956ddfe41ac2304a83848fe',
  scope: 'email', display: 'popup'
end