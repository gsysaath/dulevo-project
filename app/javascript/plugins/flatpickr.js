import flatpickr from "flatpickr";

const initFlatpickr = () => {
  if (document.querySelector(".datepicker")) {
    flatpickr(".datepicker", {
      minDate: "today",
      enableTime: true,
      time_24hr: true,
      defaultHour: 8,
      minTime: "06:00",
      maxTime: "22:00"
    });
  }
};

export { initFlatpickr };
