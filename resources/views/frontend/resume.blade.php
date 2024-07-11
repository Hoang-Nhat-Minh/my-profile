@extends('layouts.app')

@section('css')
<style>
  .progress-title {
    font-size: 18px;
    font-weight: 700;
    color: #1c2647;
    margin: 0 0 10px;
  }

  .progress {
    height: 30px;
    background: #fff;
    border-top: 5px solid #9f80ea;
    border-bottom: 5px solid #9f80ea;
    border-radius: 0;
    margin-bottom: 25px;
    overflow: visible;
    position: relative;
  }

  .progress:before,
  .progress:after {
    content: "";
    width: 5px;
    background: #9f80ea;
    position: absolute;
    top: 0;
    left: -5px;
    bottom: 0;
  }

  .progress:after {
    left: auto;
    right: -5px;
  }

  .progress-bar {
    background-color: #bb4ce9;
  }

  .progress .progress-bar {
    border: none;
    box-shadow: none;
    -webkit-animation: 2s linear 0s normal none infinite running progress-bar-stripes, animate-positive 1s;
    animation: 2s linear 0s normal none infinite running progress-bar-stripes, animate-positive 1s;
  }

  @-webkit-keyframes animate-positive {
    0% {
      width: 0;
    }
  }

  @keyframes animate-positive {
    0% {
      width: 0;
    }
  }

</style>
@endsection

@section('content')
<div class="content-wrap clearfix">
  <div class="mccan page">
    <h3 class="title-small">Resume</h3>
    <h2 class="title">Skills</h2>
    <div class="container">
      <div class="row">
        <div class="col-md-6 p-0">
          <h3 class="title-medium mb-2">Coding</h3>
          <div class="d-flex flex-column justify-content-center h-100">
            @foreach ($skill_coding as $coding)
            <h3 class="title-small mb-1">{{ $coding->name }} - {{ $coding->point*10 }}%</h3>
            <div class="progress">
              <div class="progress-bar progress-bar-striped active" style="width:{{ $coding->point*10 }}%;"></div>
            </div>
            @endforeach
          </div>
        </div>
        <div class="col-md-6 p-0">
          <h3 class="title-medium mb-2">Language</h3>
          <div>
            <canvas id="language"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="divider1"></div>
  <div class="mccan page">
    <h3 class="title-small">Resume</h3>
    <h2 class="title">Experience</h2>
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <ul class="timeline">
            @foreach ($resume_experience as $experience)
            <li>
              <div class="timeline-content">
                <h4>{{ $experience->title }}</h4> <span class="timeline-date">{{ $experience->year }}</span>
                <p>{{ $experience->des }}</p>
              </div>
            </li>
            @endforeach
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="divider1"></div>
  <div class="mccan page">
    <h3 class="title-small">Resume</h3>
    <h2 class="title">Education</h2>
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <ul class="timeline">
            @foreach ($resume_education as $education)
            <li>
              <div class="timeline-content">
                <h4>{{ $education->title }}</h4> <span class="timeline-date">{{ $education->year }}</span>
                <p>{{ $education->des }}</p>
              </div>
            </li>
            @endforeach
          </ul>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const ctx = document.getElementById('language');

  const label = @json($skill_language_name);

  const data = @json($skill_language_point);

  console.log(data);
  new Chart(ctx, {
    type: 'doughnut'
    , data: {
      labels: label
      , datasets: [{
        label: 'Communication Skills'
        , data: data
        , backgroundColor: [
          '#bb4ce9'
          , '#9f80ea'
        , ]
        , hoverOffset: 4
      }]
    }
  });

</script>
@endsection
