from flask import Flask, request, jsonify
from playwright.sync_api import sync_playwright

app = Flask(__name__)

def get_csv_url(download_page_url):
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()
        page.goto(download_page_url, wait_until="networkidle")

        with page.expect_download() as download_info:
            page.click("text='Download CSV'")

        download = download_info.value
        browser.close()
        return download.url  

@app.route('/get_csv', methods=['POST'])
def fetch_csv():
    data = request.json
    download_page_url = data.get("url")

    if not download_page_url:
        return jsonify({"error": "Missing URL"}), 400

    try:
        csv_url = get_csv_url(download_page_url)
        return jsonify({"csv_url": csv_url})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)

