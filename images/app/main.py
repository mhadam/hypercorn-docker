async def app(scope, receive, send):
    await send({
        'type': 'http.response.start',
        'status': 200,
        'headers': [
            [b'content-type', b'text/plain'],
        ]
    })
    await send({
        'type': 'http.response.body',
        'body': b'You\'ve got the "mhadam/hypercorn" Docker image running and this is the demo app.' +
                b'\n\n'
                b'To run your own app: overwrite /app/main.py, ' +
                b'or manually set APP_MODULE or some combo of MODULE_NAME and VARIABLE_NAME.',
    })
