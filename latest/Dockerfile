FROM jim3ma/leanote
# foolishflyfox/leanote:1.1 修复wkhtmltox不能正常使用问题
RUN apt purge -y wkhtmltopdf
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.jessie_amd64.deb
RUN apt update
RUN apt install xfonts-75dpi
RUN dpkg -i wkhtmltox_0.12.5-1.jessie_amd64.deb
RUN rm wkhtmltox_0.12.5-1.jessie_amd64.deb

# foolishflyfox/leanote:1.2 dockerfile 改变文件映射
RUN rm -rf /leanote/public
RUN rm -rf /leanote/mongodb_backup
RUN ln -s /leanote/data/public /leanote/public
RUN ln -s /leanote/data/mongodb_backup /leanote/mongodb_backup
