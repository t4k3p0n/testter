# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( top/Footer-Basic.css )
Rails.application.config.assets.precompile += %w( top/Highlight-Phone.scss )
Rails.application.config.assets.precompile += %w( top/ionicons.min.css )
Rails.application.config.assets.precompile += %w( top/font-awesome.min.css )
Rails.application.config.assets.precompile += %w( top/Dark-NavBar.css )
Rails.application.config.assets.precompile += %w( top/Features-Clean.css )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( Features.js )
Rails.application.config.assets.precompile += %w( MUSA_form-wizard.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( script.min.js )
Rails.application.config.assets.precompile += %w( login/Login-Form-Clean.css )
Rails.application.config.assets.precompile += %w( signup/Registration-Form-with.css )