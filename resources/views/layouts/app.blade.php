<!doctype html>
<html lang="en" class="no-js">

<head>
  <title>{{ Voyager::setting('site.title') }}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="shortcut icon" href="{{ Voyager::image(setting('site.logo')) }}">
  <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/et-lineicons.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/themify-icons.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/owl.carousel.min.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/style-animations.css') }}">
  <!-- Global site tag (gtag.js) - Google Analytics -->
  {{-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-144098545-1"></script> --}}
  {{-- <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
      dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'UA-144098545-1');

  </script> --}}

  <style>
    .error-placeholder::placeholder {
      color: red;
    }

    .error-placeholder::-webkit-input-placeholder {
      /* WebKit, Blink, Edge */
      color: red;
    }

    .error-placeholder:-moz-placeholder {
      /* Mozilla Firefox 4 to 18 */
      color: red;
      opacity: 1;
    }

    .error-placeholder::-moz-placeholder {
      /* Mozilla Firefox 19+ */
      color: red;
      opacity: 1;
    }

    .error-placeholder:-ms-input-placeholder {
      /* Internet Explorer 10-11 */
      color: red;
    }

    .error-placeholder::-ms-input-placeholder {
      /* Microsoft Edge */
      color: red;
    }

    .error-placeholder::placeholder {
      /* Most modern browsers support this now. */
      color: red;
    }

  </style>

  @yield('css')
</head>

<body class="cv has-additional-menu-content">
  <header id="identity">
    <!-- Logo -->
    <div class="logo">
      <a href="{{ route('index') }}" class="logo-link" rel="home"> <img src="{{ Voyager::image(setting('site.logo')) }}" class="logo" alt="logo" style="width:60px"></a>
    </div>
  </header>

  <!-- Menu -->
  <div id="site-menu">
    <nav class="nav-menu">
      @php
      $menu = menu('homepage', '_json');
      @endphp
      <ul>
        @foreach ($menu as $item)
        @if('/' . Request::path() === $item->url || Request::path() === $item->url)
        <li class="menu-item current-menu-item"><a href="{{ $item->url }}">{{ $item->title }}</a></li>
        @else
        <li class="menu-item"><a href="{{ $item->url }}">{{ $item->title }}</a></li>
        @endif
        @endforeach
      </ul>
    </nav>
  </div>
  {{-- <div class="menu-overlay"></div> --}}
  <div class="site-menu-toggle">
    <a href="about.html#site-menu" class="ti"><span class="screen-reader-text">Menu</span> </a>
  </div>

  <!-- Social Media -->
  <div id="social-profiles">
    <nav class="social-menu">
      <ul>
        <li class="menu-item"><a href="{{ Voyager::setting('site.facebook') }}" target="_blank"><span class="ti"></span></a></li>
        <li class="menu-item"><a href="tel:{{ Voyager::setting('site.telephone') }}" target="_blank"><span class="ti-mobile"></span></a></li>
      </ul>
    </nav>
  </div>

  <!-- Media -->
  <div class="hero-media">
    <div class="owl-carousel" data-expand-duration="800">
      <div class="item owl-lazy" data-src="{{ Voyager::image(setting('site.background')) }}"></div>
    </div> <span class="overlay"></span> <span class="ti ti-spin ti-loading"></span>
  </div>

  <!-- Content -->
  @yield('content')

  <!-- Hidden Menu -->
  {{-- <div class="additional-menu-content">
    Running Text
    <h3 class="title-small" id="job"></h3>
    End Running Text
    <h2 class="title">{{ $infos->name }}</h2>
  <img src="{{ Voyager::image($infos->img) }}" alt="about">
  <p>{{ $infos->shortDes }}</p> <a href="#" class="btn">Contact Me</a>
  </div> --}}

  <!-- My Info -->
  <div class="my-info">
    <div class="box justify-content-center align-items-center" style="height:100px">
      <div class="field field-my-info field-separator">
        <h6>Location</h6>
        <p>{{ Voyager::setting('site.address') }}</p>
      </div>
      <div class="field field-my-info field-separator">
        <h6>E-Mail</h6>
        <p>{{ Voyager::setting('site.email') }}</p>
      </div>
      <div class="field field-my-info field-separator">
        <h6>Phone</h6>
        <p>{{ Voyager::setting('site.telephone') }}</p>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Js -->
  <script src="{{ asset('assets/js/jquery-3.3.1.min.js') }}"></script>
  <script src="{{ asset('assets/js/modernizr-custom.js') }}"></script>
  <script src="{{ asset('assets/js/owl-carousel.min.js') }}"></script>
  <script src="{{ asset('assets/js/functions.js') }}"></script>

  @yield('js')
</body>

</html>
