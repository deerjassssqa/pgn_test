*** Settings ***
Resource    ../import.robot

*** Variables ***
${scan_api_device.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/hand-held/device-code
${scan_api_device.header}     {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "content-type": "application/x-www-form-urlencoded", "origin": "https://pgn-dev.toyota.co.th", "referer": "https://pgn-dev.toyota.co.th/", "sec-ch-ua": "\"Not)A;Brand\";v=\"99\", \"Google Chrome\";v=\"127\", \"Chromium\";v=\"127\"", "sec-ch-ua-mobile": "?0", "sec-ch-ua-platform": "\"macOS\"", "sec-fetch-dest": "empty", "sec-fetch-mode": "cors", "sec-fetch-site": "same-site", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
${scan_api_device.data}        client_id=your-client-id&scope=user.read
${scan_api_profile.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/hand-held/profile
${scan_api_profile.header}     {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "content-type": "application/json", "origin": "https://pgn-dev.toyota.co.th", "referer": "https://pgn-dev.toyota.co.th/", "sec-ch-ua": "\"Not)A;Brand\";v=\"99\", \"Google Chrome\";v=\"127\", \"Chromium\";v=\"127\"", "sec-ch-ua-mobile": "?0", "sec-ch-ua-platform": "\"macOS\"", "sec-fetch-dest": "empty", "sec-fetch-mode": "cors", "sec-fetch-site": "same-site", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
${scan_api_profile.data}        {"access_token":"eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og"}
${scan_api_user.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/get-user-info
${scan_api_user.header}     {"accept": "*/*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og", "content-type": "text/plain;charset=UTF-8", "origin": "https://pgn-dev.toyota.co.th", "referer": "https://pgn-dev.toyota.co.th/", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
${scan_api_location_warehouse.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/get-location-warehouse
${scan_api_location_warehouse.header}    {"accept": "*/*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og", "content-type": "application/json", "origin": "https://pgn-dev.toyota.co.th", "referer": "https://pgn-dev.toyota.co.th/", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
${scan_api_location_warehouse.data}    {"scanMode":"RCV"}
${scan_api_dlv_container_info.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/get-dlv-container-info
${scan_api_dlv_container_info.header}    {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "content-type": "application/json", "origin": "https://pgn-dev.toyota.co.th", "referer": "https://pgn-dev.toyota.co.th/", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
${scan_api_scan-receive-check-mismatch.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/get-scan-receive-check-mismatch
${scan_api_scan-receive-check-mismatch.header}     {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og"}
${scan_api_user_confirmation.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/get-user-confirmation
${scan_api_user_confirmation.header}     {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og"}
${scan_receive.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/scan-receive
${scan_receive.header}     {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og"}
${scan_sorting.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/scan-status-change
${scan_sorting.header}    {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og"}
${get-module-container-info.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/get-module-container-info
${get-module-container-info.header}     {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "content-type": "application/json", "origin": "https://pgn-dev.toyota.co.th", "referer": "https://pgn-dev.toyota.co.th/", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
${scan-status-change-r-box.url}    https://pgn-api-dev.toyota.co.th/web-api-handheld-application/r-package-scan/scan-status-change-r-box
${scan-status-change-r-box.header}     {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "content-type": "application/json", "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJub25jZSI6ImFWZ3dkOUdSem5uT05SalNEUmlEaHo2X1hjRTZTSmxpVXJTUGY4eGlXR2MiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mNmNiOTI2MS04YTNhLTQyNjEtOTc5Zi01MGVlYjE1YjQ5ODQvIiwiaWF0IjoxNzIzNDQzNjcwLCJuYmYiOjE3MjM0NDM2NzAsImV4cCI6MTcyMzQ0OTM2OCwiYWNjdCI6MSwiYWNyIjoiMSIsImFpbyI6IkFXUUFtLzhYQUFBQVRXUFFiWS9mRzNxT2tpMVdzMzdnL1BiLzVESXo5a1Q2NkVrUWNaWnNxOVJpUnIySWNPQjlXM3ViWlhPTVAwcTNsZVYrZzJ6ZWRNTDU2ck9sN0RHSWNoSXlGT0lnRmdvU0xuclRldGdIbGVEOGFmVlpRUVdDeFB3UXp2dVJIRXR0IiwiYWx0c2VjaWQiOiI1OjoxMDAzMjAwMzVENEMyMzkzIiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJQT0xZR09OIChNT0JJTEUtREVWKSIsImFwcGlkIjoiYzk0YmQxNzAtYTAzNy00MDRjLWI0N2YtMjkyNTFiYzgzNDgwIiwiYXBwaWRhY3IiOiIwIiwiZW1haWwiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJmYW1pbHlfbmFtZSI6IlVuY2hhaSIsImdpdmVuX25hbWUiOiJXYXJhbmdrYW5hIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZDljZDQ4NWUtMzliZC00Y2M5LTk1MzktOGM5NzYzMWZiYjcxLyIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjUyLjc3LjUxLjE5IiwibmFtZSI6IldhcmFuZ2thbmEgVW5jaGFpIChUTUEpIiwib2lkIjoiZDJkNWY4NjQtZjkxNi00ZDM5LWI4YWItYzQxNmQxNmQ4Yzg5IiwicGxhdGYiOiIxNCIsInB1aWQiOiIxMDAzMjAwMzdCRUY0RTk0IiwicmgiOiIwLkFVb0FZWkxMOWpxS1lVS1huMUR1c1Z0SmhBTUFBQUFBQUFBQXdBQUFBQUFBQUFDSkFIQS4iLCJzY3AiOiJvcGVuaWQgVXNlci5SZWFkIHByb2ZpbGUgZW1haWwiLCJzdWIiOiJvRGlhSnVvRFJfUzFoZG9ERlp6WktfTGR2S2dKa0hrcjhqRTBlcDhIOTdzIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFTIiwidGlkIjoiZjZjYjkyNjEtOGEzYS00MjYxLTk3OWYtNTBlZWIxNWI0OTg0IiwidW5pcXVlX25hbWUiOiJ3YXJhbmdrYW5hX3VuY19mdGhAdGRlbS50b3lvdGEtYXNpYS5jb20iLCJ1dGkiOiJSYkpaQi1lTmpVeS1IVGpYOVY3WUFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyIxM2JkMWM3Mi02ZjRhLTRkY2YtOTg1Zi0xOGQzYjgwZjIwOGEiXSwieG1zX2lkcmVsIjoiNSAxNiIsInhtc19zdCI6eyJzdWIiOiJFTFhNbHBmaGNreFljVmQ3WWUyOEo2V1lVX2w1cnhEMm4zT3o4TTZUX1dnIn0sInhtc190Y2R0IjoxNjc0NzI0NjUwfQ.KoHaEZjuXlE0_4_xkC9xljNC2W-CB6lGxTSclfTsrx_mkOLpZLctA_0mgYiT1QjRBx6wRrywBwhjceopzrs60r1RFQaR4h5-cuLXHFJ87K-lLGFZtcOJvlUv2lrfVTmP09yh1EVZSsJiXbrdKeVBbIZIyKGgtdo8XJTFmOo1vjc-4Basu64S0P1odvDzu8Sd9LJGD8xMnG0Nu6GOr8qwn2Rm4HumuqQvMn8xdcQEadnossshB03XVLOLSwiJng92c2yiT6aBkKf8eIvxlBlGgJ4Ay1mEwWSQ_D8iwTdbnN57GTvfzRHWaQO83zCau3xxcM1hatf9W5uwTQbAoHv6Og"}

*** Keywords ***
Upload File to PGN API
    [Documentation]  Test to upload file to master-upload endpoint using Python script
    [Arguments]    ${file_upload}
    ${result}=  Run Process  python3  ${CURDIR}/../custom_lib/upload_file.py  ${file_upload}  ${FUNCTION_NAME}  ${USER_ID}  ${DATA_OWNER}  ${CD}  ${BASE_URL}  stdout=TRUE  stderr=TRUE
    Log  ${result.stdout}
    Log  ${result.stderr}
    Should Contain  ${result.stdout}  201
    ${lines}=  Split String  ${result.stdout}  \n
    ${response}=  Get From List  ${lines}  1
    Log  ${response}
    ${json_response}=  Evaluate  json.loads(${response})  modules=json
    ${app_id}=  Get From Dictionary  ${json_response}  appId
    ${message}=  Get From Dictionary  ${json_response}  message
    Log  App ID: ${app_id}
    Log  Message: ${message}
    Set Global Variable    ${app_id}
    Set Global Variable    ${message}

Upload File And Check API Response APP ID
    [Documentation]  Test to upload file to master-upload endpoint using Python script
    [Arguments]    ${file_upload}
    ${result}=  Run Process  python3  ${CURDIR}/../custom_lib/upload_file.py  ${file_upload}  ${FUNCTION_NAME}  ${USER_ID}  ${DATA_OWNER}  ${CD}  ${BASE_URL}  stdout=TRUE  stderr=TRUE
    Log  ${result.stdout}
    Log  ${result.stderr}
    Should Contain  ${result.stdout}  201
    ${lines}=  Split String  ${result.stdout}  \n
    ${response}=  Get From List  ${lines}  1
    Log  ${response}
    ${json_response}=  Evaluate  json.loads(${response})  modules=json
    ${app_id}=  Get From Dictionary  ${json_response}  appId
    ${message}=  Get From Dictionary  ${json_response}  message
    Log  App ID: ${app_id}
    Log  Message: ${message}
    Set Global Variable    ${app_id}
    Set Global Variable    ${message}

Get Response Body
    [Arguments]  ${response}
    ${response_content}=  Set Variable  ${response.content}
    [Return]  ${response_content}

Capture API Response Test
    ${response}  Get API Response
    Log  ${response}

Upload File Uploading R-Package Receive And Check API Response APP ID
    [Documentation]  Test to upload file to master-upload endpoint using Python script
    [Arguments]    ${file_upload}
    ${result}=  Run Process  python3  ${CURDIR}/../custom_lib/upload_file.py  ${file_upload}  ${FUNCTION_NAME}  ${USER_ID}  ${DATA_OWNER}  ${CD}  https://pgn-api-dev.toyota.co.th/web-api-handheld-application/main-server-screen/upload-update-status-rpack  stdout=TRUE  stderr=TRUE
    Log  ${result.stdout}
    Log  ${result.stderr}
    Should Contain  ${result.stdout}  201
    ${lines}=  Split String  ${result.stdout}  \n
    ${response}=  Get From List  ${lines}  1
    Log  ${response}
    ${json_response}=  Evaluate  json.loads(${response})  modules=json
    ${app_id}=  Get From Dictionary  ${json_response}  appId
    ${message}=  Get From Dictionary  ${json_response}  message
    Log  App ID: ${app_id}
    Log  Message: ${message}
    Set Global Variable    ${app_id}
    Set Global Variable    ${message}


Shipping Information Maintenance Add API
    [Documentation]    This test case sends a POST request to the specified API.
    ${random_suffix}=    Evaluate    ''.join(random.choices(string.ascii_uppercase, k=5))    modules=random,string
    ${vessel_name}=      Set Variable    AUTOMATETESTD${random_suffix}
    ${current_date}=     Set Variable    2024-03-06
    ${api_url}=    Set Variable    https://pgn-api-dev.toyota.co.th/web-api-invoice/shipping-information-maintenance/insert-header
    ${headers}=    Create Dictionary    accept=application/json, text/plain, */*    accept-language=th-TH,th;q=0.9,en;q=0.8    content-type=application/json    origin=https://pgn-dev.toyota.co.th    referer=https://pgn-dev.toyota.co.th/    user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
    ${data}=       Evaluate    {"expCd": "TMATH", "impCompanyId": "CMP_1208_000009", "impCompanyAbbr": "TMV", "countryOfOrigin": "TH", "loadingPort": "LAEM CHABANG", "dischargingPort": "HOJIMIN", "etd": '${current_date}', "vessel": '${vessel_name}', "consignee": "TSAM", "broker": "CMP_1810_000002", "brokerAbbr": "ONE", "userId": "9ed18e70-53bb-4717-a34b-d92ce82afc3e"}    json
    ${json_data}=  Evaluate    json.dumps(${data})    json
    Log    JSON Payload: ${json_data}
    Log    Headers: ${headers}
    Log    URL: ${api_url}
    ${response}=   POST    ${api_url}    data=${json_data}    headers=${headers}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200
    Set Global Variable    ${vessel_name}
    Set Global Variable    ${current_date}

Add Shipping Information Maintenance And Update Container API
    [Documentation]    This test case sends a POST request to the specified API.
    ${random_suffix}=    Evaluate    ''.join(random.choices(string.ascii_uppercase, k=5))    modules=random,string
    ${vessel_name}=      Set Variable    AUTOMATETESTD${random_suffix}
    ${current_date}=     Set Variable    2024-02-25
    ${api_url}=    Set Variable    https://pgn-api-dev.toyota.co.th/web-api-invoice/shipping-information-maintenance/update
    ${headers}=    Create Dictionary    accept=application/json, text/plain, */*    accept-language=th-TH,th;q=0.9,en;q=0.8    content-type=application/json    origin=https://pgn-dev.toyota.co.th    referer=https://pgn-dev.toyota.co.th/    user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
    ${data}=    Evaluate    {"userId": "9ed18e70-53bb-4717-a34b-d92ce82afc3e", "email": "admin@gmail.com", "shippingData": {"expCd": "TMATH", "impCd": "", "impCompanyId": "CMP_1208_000009", "impCompanyAbbr": "TMV", "etd": "${current_date}", "csnCompanyId": "", "csnCompanyAbbr": "", "loadingPort": "LAEM CHABANG", "dischargingPort": "HOJIMIN", "vessel": "${vessel_name}", "brokerCompanyId": "CMP_1810_000002", "brokerCompanyAbbr": "ONE", "shippingInfoHId": "SIH_2408_000275", "orderTypeCd": None, "carFamilyCd": None}, "container": [{"shippingInfoDContId": "", "vanningInfoHId": "", "planContainerNo": "MOFU6813381", "planRModuleQty": "", "planRBoxDunQty": "", "actualContainerNo": "", "actualRModuleQty": "", "actualRBoxDunQty": "", "renbanNo": "", "packingMonth": "", "vanningPlant": "", "orderType": "", "status": "N", "rPackage": []}]}
    ${json_data}=  Evaluate    json.dumps(${data})    json
    Log    JSON Payload: ${json_data}
    Log    Headers: ${headers}
    Log    URL: ${api_url}
    ${response}=   POST    ${api_url}    data=${json_data}    headers=${headers}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200
    Set Global Variable    ${vessel_name}
    Set Global Variable    ${current_date}


Add Shipping Information Maintenance And Update Container API7.1.3
    [Documentation]    This test case sends a POST request to the specified API.
    ${random_suffix}=    Evaluate    ''.join(random.choices(string.ascii_uppercase, k=5))    modules=random,string
    ${vessel_name}=      Set Variable    AUTOMATETESTD${random_suffix}
    ${current_date}=     Set Variable    2024-02-25
    ${api_url}=    Set Variable    https://pgn-api-dev.toyota.co.th/web-api-invoice/shipping-information-maintenance/update
    ${headers}=    Create Dictionary    accept=application/json, text/plain, */*    accept-language=th-TH,th;q=0.9,en;q=0.8    content-type=application/json    origin=https://pgn-dev.toyota.co.th    referer=https://pgn-dev.toyota.co.th/    user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
    ${data}=    Evaluate    {"userId": "9ed18e70-53bb-4717-a34b-d92ce82afc3e", "email": "admin@gmail.com", "shippingData": {"expCd": "TMATH", "impCd": "", "impCompanyId": "CMP_1208_000009", "impCompanyAbbr": "TMV", "etd": "${current_date}", "csnCompanyId": "", "csnCompanyAbbr": "", "loadingPort": "LAEM CHABANG", "dischargingPort": "PORT KLANG", "vessel": "${vessel_name}", "brokerCompanyId": "CMP_1810_000002", "brokerCompanyAbbr": "ONE", "shippingInfoHId": "SIH_2408_000275", "orderTypeCd": None, "carFamilyCd": None}, "container": [{"shippingInfoDContId": "", "vanningInfoHId": "", "planContainerNo": "MOFU6813381", "planRModuleQty": "", "planRBoxDunQty": "", "actualContainerNo": "", "actualRModuleQty": "", "actualRBoxDunQty": "", "renbanNo": "", "packingMonth": "", "vanningPlant": "", "orderType": "", "status": "N", "rPackage": []}]}
    ${json_data}=  Evaluate    json.dumps(${data})    json
    Log    JSON Payload: ${json_data}
    Log    Headers: ${headers}
    Log    URL: ${api_url}
    ${response}=   POST    ${api_url}    data=${json_data}    headers=${headers}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200
    Set Global Variable    ${vessel_name}
    Set Global Variable    ${current_date}

Send Device Code Request
    [Documentation]    This test case sends a POST request to the device code API.
    Create Session    handheld_api    ${scan_api_device.url}    headers=${scan_api_device.header}
    ${response}=   POST    handheld_api    ${scan_api_device.url}    data=${scan_api_device.data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Profile Request
    [Documentation]    This test case sends a POST request to the profile API.
    Create Session    handheld_api    ${scan_api_profile.url}    headers=${scan_api_profile.header}
    ${response}=   POST    handheld_api    ${scan_api_profile.url}    data=${scan_api_profile.data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Get User Info Request
    [Documentation]    This test case sends a POST request to get user info API.
    Create Session    handheld_api    ${scan_api_user.url}    headers=${scan_api_user.header}
    ${response}=   POST    handheld_api    ${scan_api_user.url}    data={}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Get Location Warehouse Request
    [Documentation]    This test case sends a POST request to get location warehouse API.
    [Arguments]    ${scan_mode}
    Create Session    handheld_api    ${scan_api_location_warehouse.url}    headers=${scan_api_location_warehouse.header}
    ${data}=    Evaluate    {'scanMode': '${scan_mode}'}    json
    ${response}=   POST    handheld_api    ${scan_api_location_warehouse.url}    json=${data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Get Delivery Container Info Request
    [Documentation]    This test case sends a POST request to get delivery container info API.
    [Arguments]    ${container_no}
    Create Session    handheld_api    ${scan_api_dlv_container_info.url}    headers=${scan_api_dlv_container_info.header}
    ${data}=    Evaluate    {'userId': 'd2d5f864-f916-4d39-b8ab-c416d16d8c89', 'containerNo': '${container_no}', 'scanMode': 'DLV', 'packStatus': 'E'}    json
    ${response}=   POST    handheld_api    ${scan_api_dlv_container_info.url}    json=${data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Get Scan Receive Check Mismatch Request
    [Documentation]    This test case sends a POST request to get scan receive check mismatch API.
    [Arguments]    ${barcode_no}    ${container_no}
    Create Session    handheld_api    ${scan_api_scan-receive-check-mismatch.url}    headers=${scan_api_scan-receive-check-mismatch.header}
    ${data}=    Evaluate    {'userId': 'X', 'barcodeList': [{'barcodeNo': '${barcode_no}', 'rPackageTypeId': 0, 'rPackageType': '', 'ownerCompanyAbbr': '', 'scanDate': '2024-08-12T07:12:38.134Z', 'indexNo': 0, 'isDbExisted': False}], 'containerNo': '${container_no}'}    json
    ${response}=   POST    handheld_api    ${scan_api_scan-receive-check-mismatch.url}    json=${data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Get Scan Receive Check Mismatch Request Sorting
    [Documentation]    This test case sends a POST request to get scan receive check mismatch API.
    [Arguments]    ${barcode_no}
    Create Session    handheld_api    ${scan_api_scan-receive-check-mismatch.url}    headers=${scan_api_scan-receive-check-mismatch.header}
    ${data}=    Evaluate    {'userId': 'X', 'barcodeList': [{'barcodeNo': '${barcode_no}', 'rPackageTypeId': 0, 'rPackageType': '', 'ownerCompanyAbbr': '', 'scanDate': '2024-08-12T07:12:38.134Z', 'indexNo': 0, 'isDbExisted': False}], 'containerNo': ''}    json
    ${response}=   POST    handheld_api    ${scan_api_scan-receive-check-mismatch.url}    json=${data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Get User Confirmation Request
    [Documentation]    This test case sends a POST request to get user confirmation API.
    Create Session    handheld_api    ${scan_api_user_confirmation.url}    headers=${scan_api_user_confirmation.header}
    ${data}=    Evaluate    {"userId":"d2d5f864-f916-4d39-b8ab-c416d16d8c89","password":"MABUA"}    json
    ${response}=   POST    handheld_api    ${scan_api_user_confirmation.url}    json=${data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Scan Receive Request
    [Documentation]    This test case sends a POST request to the scan receive API.
    [Arguments]    ${barcode_no}    ${container_no}
    Create Session    handheld_api    ${scan_receive.url}    headers=${scan_receive.header}
    ${data}=    Evaluate    {"userId":"d2d5f864-f916-4d39-b8ab-c416d16d8c89","scanMode":"RCV","packStatus":"E","barcodeList":[{"barcodeNo":"${barcode_no}","rPackageTypeId":0,"rPackageType":"","ownerCompanyAbbr":"","scanDate":"2024-08-12T07:12:38.472Z","indexNo":0,"isDbExisted":false}],"handheldConfigId":"HHC_120101_000003","containerNo":"${container_no}"}
    ${response}=   POST    handheld_api    ${scan_receive.url}    json=${data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Send Scan Status Change Request @CFIN
    [Documentation]    This test case sends a POST request to the scan status change API.
    [Arguments]    ${scan_mode}    ${barcode_no}
    Create Session    handheld_api    ${scan_sorting.url}    headers=${scan_sorting.header}
    ${scan_sorting.data}=    Evaluate    {"userId":"d2d5f864-f916-4d39-b8ab-c416d16d8c89","scanMode":"${scan_mode}","packageStatus":"FG","packStatus":"E","barcodeList":[{"barcodeNo":"${barcode_no}","rPackageTypeId":0,"rPackageType":"","ownerCompanyAbbr":"","scanDate":"2024-08-12T07:48:51.081Z","indexNo":0,"isDbExisted":false}],"handheldConfig":"HHC_120101_000004","containerNo":""}
    ${response}=   POST    handheld_api    ${scan_sorting.url}    json=${scan_sorting.data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Get Module Container Info
    [Documentation]    This test case sends a POST request to the get module container info API.
    [Arguments]    ${scan_mode}    ${barcode_no}
    Create Session    handheld_api    ${get-module-container-info.url}    headers=${get-module-container-info.header}
    ${get-module-container-info.data}=    Evaluate    {"userId":"d2d5f864-f916-4d39-b8ab-c416d16d8c89","handheldConfigId":"HHC_120101_000004","scanMode":"${scan_mode}","modeOperation":"SELECT","barcodeScanNo":"${barcode_no}"}
    ${response}=   POST    handheld_api    ${get-module-container-info.url}    json=${get-module-container-info.data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Scan Status Change R-Box
    [Documentation]    This test case sends a POST request to the scan status change R-Box API.
    [Arguments]    ${scan_mode}    ${barcode_no}
    Create Session    handheld_api    ${BASE_URL}    headers=${HEADERS}
    ${scan-status-change-r-box.data}=    Evaluate    {"userId":"d2d5f864-f916-4d39-b8ab-c416d16d8c89","scanMode":"${scan_mode}","packStatus":"E","handheldConfig":"HHC_120101_000004","barcodeScanNo":"${barcode_no}","scanQty":0,"rPackStatusTo":"FG","rPackageList":[{"rPkgTypeId":"PKT_1208_000004","rPkgType":"SN","fgQty":1,"ngQty":1,"lostQty":2},{"rPkgTypeId":"PKT_1208_000005","rPkgType":"FB","fgQty":1,"ngQty":1,"lostQty":2},{"rPkgTypeId":"PKT_1208_000006","rPkgType":"FC","fgQty":1,"ngQty":1,"lostQty":2}]}
    ${response}=   POST    handheld_api    ${BASE_URL}    json=${scan-status-change-r-box.data}
    Log    Status Code: ${response.status_code}
    Log    Response Content: ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

Inventory Upload Interface And Check API Response APP ID
    [Documentation]  Test to upload file to master-upload endpoint using Python script
    [Arguments]    ${file_upload}    ${function_id}
    ${result}=  Run Process  python3  ${CURDIR}/../custom_lib/read_interface_file_inventory.py  ${file_upload}  ${function_id}  https://pgn-api-dev.toyota.co.th/web-api-inventory-management/inventory-upload-interface  stdout=TRUE  stderr=TRUE
    Log  ${result.stdout}
    Log  ${result.stderr}
    Should Contain  ${result.stdout}  201
    ${lines}=  Split String  ${result.stdout}  \n
    ${response}=  Get From List  ${lines}  1
    Log  ${response}
    ${json_response}=  Evaluate  json.loads(${response})  modules=json
    ${app_id}=  Get From Dictionary  ${json_response}  appId
    ${message}=  Get From Dictionary  ${json_response}  message
    Log  App ID: ${app_id}
    Log  Message: ${message}
    Set Global Variable    ${app_id}
    Set Global Variable    ${message}
