import React, { useRef, useState, useEffect } from "react";
import Helmet from "../../components/Helmet/Helmet";
import SlideBar from "../../components/UI/slider/SlideBar";
import "../../styles/dashboard.scss";
import "../../styles/admin.scss";
import { Link } from "react-router-dom";
import {
  Form,
  Button,
  FormGroup,
  FormControl,
  ControlLabel,
} from "react-bootstrap";

//date time picker
import TextField from "@mui/material/TextField";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";

const Admin = () => {
  //date time picker
  const [value, setValue] = React.useState(null);

  return (
    <Helmet title="AdminPage">
      <div className="admin__section d-flex">
        <SlideBar />
        <div className="main__content">
          <h1>This is dashboard</h1>
        </div>
      </div>
    </Helmet>
  );
};

export default Admin;
