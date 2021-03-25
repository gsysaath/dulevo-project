import flatpickr from "flatpickr";

const initFlatpickr = () => {
  if (document.querySelector(".datepicker")) {
    flatpickr(".datepicker", {
      dateFormat: "d/m/Y",
      minDate: "today",
      defaultDate: "today",
    });
  }
};

export { initFlatpickr };
