# capture_api_response.py
import asyncio
from pyppeteer import launch

async def capture_response():
    browser = await launch(headless=False)
    page = await browser.newPage()

    response_data = {}

    # Intercept responses
    async def intercept_response(response):
        if 'web-api-master/master-upload' in response.url:
            response_data['json'] = await response.json()

    page.on('response', intercept_response)

    # Navigate to the page and trigger the upload
    await page.goto('https://pgn-dev.toyota.co.th/')
    # You may need to common.Log In or perform other actions here to reach the upload step

    # Wait for a certain time or until the upload request is captured
    await asyncio.sleep(10)  # Adjust this based on your needs

    await browser.close()

    return response_data.get('json', None)

def get_api_response():
    return asyncio.get_event_loop().run_until_complete(capture_response())
