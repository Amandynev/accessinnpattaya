import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const flatpickrDisplay = () => {
  flatpickr("#range_start", {
    plugins: [new rangePlugin({ input: "#range_end"})],
    minDate: "today",
    disableMobile: "true",
    allowInput: document.body.dataset.markerEnv === 'test' ? "true" : "false"
  });
};

export { flatpickrDisplay }