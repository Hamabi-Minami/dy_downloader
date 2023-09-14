import requests
from flask import Flask
from utils.tools import dy
import os
from loguru import logger

app = Flask(__name__)

from flask import jsonify, json, request, make_response, Response, stream_with_context, send_file
import mimetypes


"""
0.00 xse:/ # 甜辣妹 # 奶凶 https://v.douyin.com/65Skoyq/ 复制此链接，打开Dou音搜索，直接观看视频！
name: 甜辣妹 # 奶凶
link: 65Skoyq
"""
@app.route("/download/", methods=["GET"])
def downloadFile():
    base_link = 'https://v.douyin.com/'
    share_link = request.args.get('link', None)
    if not share_link:
        return jsonify({'error': 'link not found'})
    video_link = base_link + share_link

    logger.error(video_link)

    filename, title = dy(video_link)
    # print('filename', filename)

    baseDir = os.path.join(os.getcwd(), "static")
    pathname = os.path.join(baseDir, filename)
    f = open(pathname, "rb")
    response = Response(f.readlines())
    # response = make_response(f.read())
    mime_type = mimetypes.guess_type(filename)[0]
    response.headers['Content-Type'] = mime_type
    # filename = filename.encode().decode('latin-1')
    # print('filename', filename)
    response.headers['Content-Disposition'] = 'attachment; filename={}'.format(title.replace('\n', '').encode().decode('latin-1'))
    return response


# @app.route('/download', methods=['get'])
# def download():
#     def generate(video_content):
#         pass


# http://orientalgames.cn:2202/downloadFile/?link=65MQHfp
print(app.url_map)
if __name__ == '__main__':
    app.run(host='192.168.1.3', port=5000, debug=True)
