@extends('layouts.app')

@section('content')
<div class="content-wrap clearfix">
  <!-- About Me -->
  <div class="mccan page">
    <div class="d-flex flex-column align-items-center justify-content-center mb-3">
      <img src="{{ Voyager::image($infos->img) }}" alt="about" style="width:200px;height:200px">
      <h2 class="title m-0">{{ $infos->name }}</h2>
      <span class="title-medium">I am a <span class="title-medium" id="job"></span></span>
    </div>
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <p>{{ $infos->des }}</p>
          <div class="row">
            <div class="col-md-6">
              <p><b>Birthday:</b> {{ $infos->birthday }}</p>
              <p><b>Website:</b> {{ Voyager::setting('site.website') }}</p>
              <p><b>Phone:</b> {{ Voyager::setting('site.telephone') }}</p>
            </div>
            <div class="col-md-6">
              <p><b>Degree:</b> {{ $infos->degree }}</p>
              <p><b>Mail:</b> {{ Voyager::setting('site.email') }}</p>
              <p><b>Facebook:</b><a href="{{ Voyager::setting('site.facebook') }}"> Facebook</a></p>
            </div>
          </div> <a href="#" class="btn ajax">Contact Me!</a>
        </div>
      </div>
    </div>
  </div>

  <div class="divider1"></div>
  <!-- Services -->
  <div class="mccan page">
    <h3 class="title-small">What I Like</h3>
    <h2 class="title">Hobbies</h2>
    <div class="content">
      <div class="grid-container">
        <div class="grid-column">
          <div class="row">
            @foreach($servies as $servie)
            <div class="col-md-6">
              <div class="feature feature-left">
                <div class="mccan-icon"> <span class="{{ $servie->icon }} font-35px"></span> </div>
                <div class="mccan-text">
                  <h3>{{ $servie->title }}</h3>
                  <p>{{ $servie->des }}</p>
                </div>
              </div>
            </div>
            @endforeach
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="divider1"></div>
  <!-- Services -->
  <div class="mccan page">
    <h3 class="title-small">My Music Playlist</h3>
    <h2 class="title">Give it a try :)</h2>
    <div class="content">
      <iframe width="100%" height="400" src="https://www.youtube.com/embed/videoseries?si=WWPfNWnXcpTBCr9U&amp;list=PLgwbrxDqmNIVkDwaPZ3NkK0uHwJHYRXWI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
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
  // Encode the job names array to JSON format and assign it to a JavaScript variable
  var aText = @json($jobNames);

  var iSpeed = 100; // Time delay of print out
  var iIndex = 0; // Start printing array at this position
  var iTextPos = 0; // Initialize text position
  var sContents = ''; // Initialize contents variable
  var destination = document.getElementById("job");
  var isDeleting = false; // Flag to indicate deletion phase

  function typewriter() {
    var currentText = aText[iIndex];
    if (!isDeleting) {
      sContents = currentText.substring(0, iTextPos);
      destination.innerHTML = sContents + "_";
      if (iTextPos++ == currentText.length) {
        isDeleting = true;
        setTimeout(typewriter, 1500); // Pause before starting deletion
      } else {
        setTimeout(typewriter, iSpeed);
      }
    } else {
      sContents = currentText.substring(0, iTextPos);
      destination.innerHTML = sContents + "_";
      if (iTextPos-- == 0) {
        isDeleting = false;
        iIndex++;
        if (iIndex == aText.length) {
          iIndex = 0; // Restart from the beginning if end of array is reached
        }
        setTimeout(typewriter, 500); // Pause before starting the next text
      } else {
        setTimeout(typewriter, iSpeed);
      }
    }
  }

  typewriter();

</script>
@endsection
