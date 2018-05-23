<!doctype html>
<html lang="{{ app()->getLocale() }}" dir="ltr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta http-equiv="Content-Language" content="en" />
  <meta name="msapplication-TileColor" content="#2d89ef">
  <meta name="theme-color" content="#4188c9">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="HandheldFriendly" content="True">
  <meta name="MobileOptimized" content="320">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <link rel="icon" href="./favicon.ico" type="image/x-icon"/>
  <link rel="shortcut icon" type="image/x-icon" href="./favicon.ico" />

  <title>{{ config('app.name', 'Laravel') }}</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">

  <!-- Scripts -->
  <script src="{{ asset('js/app.js') }}" defer></script>

  <!-- Dashboard Core -->
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
<div class="page">
  <div class="page-single">
    <div class="container">
      <div class="row">
        <div class="col col-login mx-auto">
          <div class="text-center mb-6">
            <img src="./demo/brand/tabler.svg" class="h-6" alt="">
          </div>
          <form class="card" method="POST" action="{{ route('login') }}">
            @csrf
            <div class="card-body p-6">
              <div class="card-title">Login to your account</div>
              <div class="form-group">
                <label class="form-label">Email address</label>
                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                @if ($errors->has('email'))
                  <span class="invalid-feedback">
                        <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif
              </div>
              <div class="form-group">
                <label class="form-label">
                  Password
                  <a href="{{ route('password.request') }}" class="float-right small">I forgot password</a>
                </label>
                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>
                @if ($errors->has('password'))
                  <span class="invalid-feedback">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                @endif
              </div>
              <div class="form-group">
                <label class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" name="remember" {{ old('remember') ? 'checked' : '' }}>
                  <span class="custom-control-label">Remember me</span>
                </label>
              </div>
              <div class="form-footer">
                <button type="submit" class="btn btn-primary btn-block">Sign in</button>
              </div>
            </div>
          </form>
          <div class="text-center text-muted">
            Don't have account yet? <a href="./register.html">Sign up</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>


