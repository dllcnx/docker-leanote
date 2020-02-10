#! bin/sh
rm -rf leanote app.conf leanote_cache views && mkdir leanote
https://github.com/KeiferJu/leanote.git leanote_cache
mv ./leanote_cache/conf/app.conf ./ && mv ./leanote_cache/app/views ./ && mv ./leanote_cache/public ./leanote && mv ./leanote_cache/mongodb_backup ./leanote && mkdir ./leanote/files && mkdir ./leanote/public/upload
rm -rf leanote_cache
sed -i 's/db.host=127.0.0.1/db.host=mongo/g' ./app.conf
