# change this to your app's class name and uncomment it
# NEWNAME=StatusTracker

sed "s/TestDk/$NEWNAME/g" config/application.rb > tmp; mv tmp config/application.rb

sed "s/TestDk/$NEWNAME/g" config/environment.rb > tmp; mv tmp config/environment.rb 
sed "s/TestDk/$NEWNAME/g" config/environments/development.rb > tmp; mv tmp config/environments/development.rb 
sed "s/TestDk/$NEWNAME/g" config/environments/production.rb > tmp; mv tmp config/environments/production.rb 
sed "s/TestDk/$NEWNAME/g" config/environments/test.rb > tmp; mv tmp config/environments/test.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/secret_token.rb > tmp; mv tmp config/initializers/secret_token.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/secret_token.rb > tmp; mv tmp config/initializers/secret_token.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/secret_token.rb > tmp; mv tmp config/initializers/secret_token.rb 
sed "s/TestDk/$NEWNAME/g" config/initializers/session_store.rb > tmp; mv tmp config/initializers/session_store.rb 
sed "s/TestDk/$NEWNAME/g" config/routes.rb > tmp; mv tmp config/routes.rb 
sed "s/TestDk/$NEWNAME/g" Rakefile > tmp; mv tmp Rakefile 
