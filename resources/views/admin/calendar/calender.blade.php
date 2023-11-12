@extends('layouts.app', ['activePage' => 'calendar'])

@section('css')
<style>
    #calendar {
    max-width: 1100px;
    margin: 40px auto;
}
</style>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css' />
{{-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css"> --}}
@endsection


@section('content')
<div class="container-fluid mt-5">
    <div class="card">
        <div class="card-header">
            <button class="btn btn-sm pending">{{__('Pending')}}</button>
            <button class="btn btn-sm cancel">{{__('Cancel')}}</button>
            <button class="btn btn-sm reject">{{__('Reject')}}</button>
            <button class="btn btn-sm complete">{{__('Complete')}}</button>
            <button class="btn btn-sm approve">{{__('Approve')}}</button>
        </div>
        <div class="card-body">
            <div id='calendar'></div>

        </div>
    </div>

    <div class="modal right fade" id="show_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="{{ url('admin/coworkers') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-header">
                        <h1>{{__('appointment detail')}}</h1>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="file-upload text-center p-1">
                            <img src="" id="user_image" width="150" height="150" class="rounded-lg"/>
                        </div>

                        <table class="table">
                            <tr>
                                <td>{{__('Appointment Id')}}</td>
                                <td id="appointment_id"></td>
                            </tr>
                            <tr>
                                <td>{{__('Name')}}</td>
                                <td id="user_name"></td>
                            </tr>
                            <tr>
                                <td>{{__('Coworker name')}}</td>
                                <td id="Coworker_name"></td>
                            </tr>
                            <tr>
                                <td>{{__('service name')}}</td>
                                <td id="service_name"></td>
                            </tr>
                            <tr>
                                <td>{{__('Service at')}}</td>
                                <td id="service_at"></td>
                            </tr>
                            <tr>
                                <td>{{__('Date')}}</td>
                                <td id="date"></td>
                            </tr>
                            <tr>
                                <td>{{__('start time')}}</td>
                                <td id="start_time"></td>
                            </tr>
                            <tr>
                                <td>{{__('end time')}}</td>
                                <td id="end_time"></td>
                            </tr>
                            <tr>
                                <td>{{__('Duration')}}</td>
                                <td id="duration"></td>
                            </tr>
                            <tr>
                                <td>{{__('Amount')}}</td>
                                <td id="amount"></td>
                            </tr>
                            <tr>
                                <td>{{__('payment status')}}</td>
                                <td id="payment_status"></td>
                            </tr>
                            <tr>
                                <td>{{__('Appointment status')}}</td>
                                <td id="appointment_status"></td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section('js')
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js'></script>
{{-- <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js'></script> --}}
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>

<script>
// $(document).ready(function ()
// {
//     var calendarEl = document.getElementById('calendar');

//     var calendar = new FullCalendar.Calendar(calendarEl, {
//         initialView: 'dayGridMonth',
//         initialDate: '2022-08-12',
//         events: [
//             @foreach($appointments as $appointment)
//             {
//                 id: '{{ $appointment->id}}',
//                 title : '{{ $appointment->user->name}}',
//                 start : moment('{{ $appointment->date.' '.$appointment->start_time }}').format('YYYY-MM-DD HH:mm:ss'),
//             },
//             @endforeach
//         ],
//         eventClick: function(calEvent, jsEvent, view)
//         {
//             console.log('calEvent',calEvent);
//             console.log('jsEvent',jsEvent);
//             console.log('view',view);
//             eventClicked(calEvent.id)
//             $('#start_time').val(moment(calEvent.start).format('YYYY-MM-DD HH:mm:ss'));
//             $('#finish_time').val(moment(calEvent.end).format('YYYY-MM-DD HH:mm:ss'));
//             $('#show_modal').modal();
//         }
//     });

//     calendar.render();
// });
    $(document).ready(function() {
        $('#calendar').fullCalendar({
            // put your options and callbacks here
            initialView: 'dayGridMonth',
            events : [
                @foreach($appointments as $appointment)
                {
                    id: '{{ $appointment->id}}',
                    title : '{{ $appointment->user->name}}',
                    @if ($appointment->appointment_status == "CANCEL")
                        color: "rgba(251, 175, 190, .5)",
                        textColor:"#b3092b",
                    @elseif ($appointment->appointment_status == "PENDING")
                        color: "rgba(203, 210, 246, .5)",
                        textColor:"#2236a8",
                    @elseif ($appointment->appointment_status == "APPROVE")
                        color: "rgba(136, 230, 247, .5)",
                        textColor:"#05879e",
                    @elseif ($appointment->appointment_status == "COMPLETE")
                        color: "rgba(147, 231, 195, .5)",
                        textColor:"#1a8a59",
                    @else
                        color: "rgba(11, 11, 11, .5)",
                        textColor:"#111111",
                    @endif

                    start : moment('{{ $appointment->date.' '.$appointment->start_time }}').format('YYYY-MM-DD HH:mm:ss'),
                    @if ($appointment->finish_time)
                            end: '{{ $appointment->finish_time }}',
                    @endif
                },
                @endforeach
            ],
            eventColor: 'black',
            eventClick: function(calEvent, jsEvent, view)
            {
                console.log('calEvent',calEvent);
            console.log('jsEvent',jsEvent);
            console.log('view',view);
                eventClicked(calEvent.id)
                $('#show_modal').modal();
            }
        });
    });
</script>
@endsection
