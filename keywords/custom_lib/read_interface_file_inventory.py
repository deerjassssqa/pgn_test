import requests
import sys

def upload_file(file_path, function_id,url):
    files = {
        'functionId': (None, function_id),
        'file': (file_path, open(file_path, 'rb'), 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    }
    
    headers = {
        'accept': 'application/json, text/plain, */*',
        'accept-language': 'th-TH,th;q=0.9,en;q=0.8',
        'origin': 'https://pgn-dev.toyota.co.th',
        'priority': 'u=1, i',
        'referer': 'https://pgn-dev.toyota.co.th/',
        'sec-ch-ua': '"Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"macOS"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-site',
        'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36'
    }

    response = requests.post(url, files=files, headers=headers)
    print(response.status_code)
    print(response.content)
    return response.status_code, response.content

if __name__ == "__main__":
    file_path = sys.argv[1]
    function_id = sys.argv[2]
    url = sys.argv[3]
    upload_file(file_path, function_id, url)
