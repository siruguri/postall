# change this to your app's class name and uncomment it
# NEWNAME=StatusTracker

sed "s/TestDk/$NEWNAME/g" config/application.rb > _tmp; mv _tmp config/application.rb

sed "s/TestDk/$NEWNAME/g" config/environment.rb > _tmp; mv _tmp config/environment.rb 
sed "s/TestDk/$NEWNAME/g" config/environments/development.rb > _tmp; mv _tmp config/environments/development.rb 
sed "s/TestDk/$NEWNAME/g" config/environments/production.rb > _tmp; mv _tmp config/environments/production.rb 
sed "s/TestDk/$NEWNAME/g" config/environments/test.rb > _tmp; mv _tmp config/environments/test.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/secret_token.rb > _tmp; mv _tmp config/initializers/secret_token.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/secret_token.rb > _tmp; mv _tmp config/initializers/secret_token.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/secret_token.rb > _tmp; mv _tmp config/initializers/secret_token.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/session_store.rb > _tmp; mv _tmp config/initializers/session_store.rb 
sed "s/TestDk/$NEWNAME/g" config/routes.rb > _tmp; mv _tmp config/routes.rb 
sed "s/TestDk/$NEWNAME/g" Rakefile > _tmp; mv _tmp Rakefile 
