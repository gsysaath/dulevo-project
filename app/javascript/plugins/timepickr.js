import flatpickr from "flatpickr";

const initTimepickr = () => {
  if (document.querySelector(".timepicker")) {
    flatpickr(".timepicker", {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true,
      allowInput: true,
      defaultDate: "08:30",
    });
  }
};

export { initTimepickr };
