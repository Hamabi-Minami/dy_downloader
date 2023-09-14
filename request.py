import re
from loguru import logger

import requests

headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3877.400 QQBrowser/10.8.4506.400',
    'cookie': '__gads=ID=0613c5de4392f6a6-2268f52184cf0004:T=1640239783:RT=1640239783:S=ALNI_MYFmzURQ4PZLUsx8kWq5VTByZe82A; Hm_lvt_338f36c03fc36a54e79fbd2ebdae9589=1640239784,1640259798; Hm_lpvt_338f36c03fc36a54e79fbd2ebdae9589=1640259798'
}

origin_url = 'https://v.douyin.com/DWMHgaG/'
r = requests.get(origin_url, headers=headers, allow_redirects=False)
logger.debug(r.content)

with open('url.txt', 'r') as f:
    r = requests.get(f'https:{f.read()}')

data = r.content  # 获取返回的视频二进制数据
temp_path = 'D:\\Code\\Python\\douyin_downloader\\static\\videos\\'
# print(data)
title = 'new version tiktok'
rstr = r"[\/\\\:\*\?\"\<\>\|\n]"  # '/ \ : * ? " < > |'
new_title = re.sub(rstr, "_", title)  # 过滤不能作为文件名的字符，替换为下划线
c = '%s.mp4' % new_title  # 视频文件的命名
file = open(temp_path + c, 'wb')  # 创建open对象
file.write(data)  # 写入数据
file.close()  # 关闭
