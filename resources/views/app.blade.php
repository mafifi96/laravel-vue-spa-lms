<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{csrf_token()}}">
        <title>Laravel</title>
        <link rel="stylesheet" href="{{asset("css/all.min.css")}}">
        <link rel="stylesheet" href="{{asset("css/fontawesome.min.css")}}">
        <script src="{{asset("js/jquery-3.6.0.js")}}"></script>
        <script src="{{asset("js/fontawesome.min.js")}}"></script>

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">

         @vite('resources/css/app.css')
    </head>
    <body class="antialiased">
        <div id="app">
            <App></App>
        </div>
        @vite('resources/js/app.js')

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>

<noscript>
    please enable js to continue
</noscript>
    </body>
</html>

