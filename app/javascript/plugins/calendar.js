const calendar_pat = () => {
  const calendarBox = document.querySelector('.calendar-box');
  if (calendarBox) {
    const startInput = document.querySelector('#range_start');
    const endInput = document.querySelector('#range_end');
    const startDayCalendar = document.getElementById('start-day-calendar');
    const startMonthCalendar = document.getElementById('start-day-calendar');
    const endDayCalendar = document.getElementById('end-day-calendar');
    const endMonthCalendar = document.getElementById('end-day-calendar');
    startInput.addEventListener('change', () => {
      const dateStart = new Date(startInput.value);
      if (!isNaN(dateStart.getTime())){
        startMonthCalendar.innerText = dateStart.toString().split(" ")[1];
        startDayCalendar.innerText = dateStart.toString().split(" ")[2];
      }
      const dateEnd = new Date(endInput.value);
      if (!isNaN(dateEnd.getTime())){
        endMonthCalendar.innerText = dateEnd.toString().split(" ")[1];
        endDayCalendar.innerText = dateEnd.toString().split(" ")[2];
      }
    })
  }
}

export { calendar_pat };