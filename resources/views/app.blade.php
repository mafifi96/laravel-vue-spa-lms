<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Laravel</title>
        <script src="{{asset("js/jquery-3.6.0.js")}}"></script>
        <script src="{{asset("js/tcss.js")}}"></script>
        <link rel="stylesheet" href="{{ mix("css/app.css") }}">

    </head>
    <body class="antialiased">
        <div id="app">
            <app></app>
        </div>

 <script  src="{{ mix("js/app.js") }}"></script>
<noscript>
    please enable js to continue
</noscript>
    </body>
</html>

