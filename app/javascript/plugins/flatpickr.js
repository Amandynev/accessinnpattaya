import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const flatpickrDisplay = () => {
  const bookingDatesDisabled = document.getElementById('booking-dates-disabled');
  if (bookingDatesDisabled){
    const bookings = JSON.parse(bookingDatesDisabled.dataset.bookings);
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: "today",
      disableMobile: "true",
      allowInput: document.body.dataset.markerEnv === 'test' ? "true" : "false",
      "disable": bookings
    });
  } else {
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: "today",
      disableMobile: "true",
      allowInput: document.body.dataset.markerEnv === 'test' ? "true" : "false",
    });
  }
};

export { flatpickrDisplay }