#!/bin/sh

if [ "$(find ./run_scripts/ -name '*.sh')" ]; then
   echo "Executing additional scripts..."
   for SCRIPT in ./run_scripts/*.sh
   do
      sh $SCRIPT
   done
fi

echo "Check if folder is empty."

if  [ "$(ls -A ./)" ]; then
    echo "Starting server..."
    hexo server
  else
    hexo init /blog
    npm install --save hexo-generator-sitemap
    npm install --save hexo-generator-index
    npm install --save hexo-generator-archive
    npm install --save hexo-generator-category
    npm install --save hexo-generator-tag
    npm install --save hexo-admin
    npm install --save hexo-deployer-shell
    echo "Template built."
fi
