import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#range_start", {
  plugins: [new rangePlugin({ input: "#range_end"})],
  minDate: "today"
});