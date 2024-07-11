@extends('layouts.app')

@section('css')
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
<style>
  .truncate {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .alert_custom {
    position: fixed;
    pointer-events: none;
    width: 100%;
    height: 100vh;
    top: 0;
    left: 0;
    z-index: 9999999999;
  }

  /* list */
  .alert_custom .list {
    display: flex;
    flex-direction: column;
    margin: 1rem;
    width: 100%;
    max-width: 400px;
    float: right;
  }

  /* item */
  .alert_custom .list .item {
    --line-height: 4px;
    position: relative;
    display: flex;
    align-items: center;
    padding: .5rem;
    color: #fff;
    border-radius: 0.25rem;
    overflow: hidden;
    padding-bottom: calc(.5rem + var(--line-height))
  }

  .alert_custom .list .item.success {
    background: #16A34A;
  }

  .alert_custom .list .item.error {
    background: #EAB308;
  }

  .alert_custom .list .item::after {
    content: "";
    position: absolute;
    width: 0;
    height: var(--line-height);
    background: #fff;
    bottom: 0;
    left: 0;
    animation: line 3s linear;
  }

  /* icon */
  .alert_custom .list .icon {
    flex: none;
    display: block;
    width: 40px;
    height: 40px;
  }

  .alert_custom .list .icon svg {
    width: 100%;
    height: 100%;
  }

  /* title */
  .alert_custom .list .title {
    min-width: 0;
    flex-grow: 1;
    margin-left: .5rem;
  }

  .alert_custom .list .title h6 {
    width: 100%;
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 14px !important;
    color: inherit !important;
    font-weight: bold;
    line-height: 1.5;
    margin: 0;
  }

  .alert_custom .list .title p {
    width: 100%;
    font-family: Arial, Helvetica, sans-serif !important;
    font-size: 12px !important;
    color: inherit !important;
    margin: 0rem !important;
    line-height: 1.5;
  }

  /* transiton */
  .transition_all {
    transition: all .3s ease-in-out;
  }

  .enter_start {
    transform: scale(0);
    opacity: 0;
  }

  .enter_end {
    transform: scale(1);
    opacity: 1;
  }

  .leave_start {
    transform: translateX(0);
    opacity: 1;
  }

  .leave_end {
    transform: translateX(100%);
    opacity: 0;
  }

  @keyframes line {
    from {
      width: 0;
    }

    to {
      width: 100%;
    }
  }

</style>
@endsection

@section('content')
<!-- Alert -->
<div x-data="alert" class="alert_custom">
  <div class="list">
    <template x-for="item in list" :key="item.id">
      <div class="item" x-show="item.show" x-transition:enter="transition_all" x-transition:enter-start="enter_start" x-transition:enter-end="enter_end" x-transition:leave="transition_all" x-transition:leave-start="leave_start" x-transition:leave-end="leave_end" :class="item.type">
        <span class="icon">
          <template x-if="item.type == 'success'">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" style="fill: currentColor">
              <path d="m10 15.586-3.293-3.293-1.414 1.414L10 18.414l9.707-9.707-1.414-1.414z"></path>
            </svg>
          </template>
          <template x-if="item.type == 'error'">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" style="fill: currentColor">
              <path d="M11.953 2C6.465 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.493 2 11.953 2zM12 20c-4.411 0-8-3.589-8-8s3.567-8 7.953-8C16.391 4 20 7.589 20 12s-3.589 8-8 8z"></path>
              <path d="M11 7h2v7h-2zm0 8h2v2h-2z"></path>
            </svg>
          </template>
        </span>
        <div class="title">
          <h6 class="truncate" x-text="item.title"></h6>
          <p x-text="item.body"></p>
        </div>
      </div>
    </template>
  </div>
</div>

<!-- Content -->
<div class="content-wrap">
  <div class="mccan page">
    <h3 class="title-small">LOCATION</h3>
    <h2 class="title">Contact Me</h2>
    <div class="content">
      <div class="row">
        <div class="col-md-12">
          <p>If you’d like to talk about a project, my work or anything else then get in touch.</p>
          <div class="list">
            <ul>
              <li><strong>Phone :</strong> {{ Voyager::setting('site.telephone') }}</li>
              <li><strong>Email :</strong> {{ Voyager::setting('site.email') }}</li>
              <li><strong>Address :</strong> {{ Voyager::setting('site.address') }}</li>
              <li><strong>Map :</strong> <a href="{{ Voyager::setting('site.map') }}" target="_blank">via Google Maps</a></li>
            </ul>
          </div>
          {!! Voyager::setting('site.mapiframe') !!}
        </div>
      </div>
      <div class="divider1"></div>
      <div class="row">
        <div class="col-md-12">
          <h6 class="mb-20"><strong>Get in touch</strong></h6>
          <form method="post" class="contact__form" action="{{ route('contact.store') }}">
            @csrf

            <!-- Form elements -->
            <div class="row">
              <div class="col-md-6 form-group">
                @if($errors->has('name'))
                <input name="name" type="text" class="error-placeholder" placeholder="{{ $errors->first('name') }}">
                @else
                <input name="name" type="text" placeholder="Your Name *" value="{{ old('name') }}">
                @endif
              </div>

              <div class="col-md-6 form-group">
                @if($errors->has('email'))
                <input name="email" type="email" class="error-placeholder" placeholder="{{ $errors->first('email') }}">
                @else
                <input name="email" type="email" placeholder="Your Email" value="{{ old('email') }}">
                @endif
              </div>

              <div class="col-md-6 form-group">
                @if($errors->has('number'))
                <input name="number" type="text" class="error-placeholder" placeholder="{{ $errors->first('number') }}">
                @else
                <input name="number" type="text" placeholder="Your Number *" value="{{ old('number') }}">
                @endif
              </div>

              <div class="col-md-6 form-group">
                @if($errors->has('subject'))
                <input name="subject" type="text" class="error-placeholder" placeholder="{{ $errors->first('subject') }}">
                @else
                <input name="subject" type="text" placeholder="Subject *" value="{{ old('subject') }}">
                @endif
              </div>

              <div class="col-md-12 form-group">
                <label for="message">Your message *</label>
                @if($errors->has('message'))
                <textarea class="error-placeholder" name="message" id="message" cols="30" rows="4" placeholder="{{ $errors->first('message') }}"></textarea>
                @else
                <textarea name="message" id="message" cols="30" rows="4">{{ old('message') ? old('message') : '' }}</textarea>
                @endif
              </div>
              <div class="col-md-12">
                <input name="submit" type="submit" value="Send Message">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- Copyright -->
  <div class="copyright">
    <p>&copy; {{ Carbon\Carbon::now()->year }} <a href="{{ route('index') }}">{{ Voyager::setting('site.title') }}</a>. All Rights Reserved.</p>
  </div>
</div>
@endsection

@section('js')
<script>
  document.addEventListener('alpine:init', () => {
    Alpine.data('alert', () => ({
      index: 0
      , list: []
      , init() {
        // this.addAlert({body: 'dsa'})
        let alert = JSON.parse(`@json(session()->get('alert'))`)

        if (alert) {
          this.addAlert(alert);
          localStorage.clear(); //Custom
        }
      }
      , addAlert(alert) {
        this.list = [...JSON.parse(JSON.stringify(this.list)), {
          id: ++this.index
          , type: alert.type
          , title: alert.title
          , body: alert.body
          , show: false
        }]

        this.$nextTick(() => {
          this.list[this.index - 1].show = true
        })

        setTimeout(() => {
          this.list[this.index - 1].show = false
        }, 3000);
      }
    }));
  });

</script>
@endsection
