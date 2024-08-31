import React, { useEffect, useState } from "react";

import DisplayWeatherData from "./DisplayWeatherData";

import { getWeatherDataApi } from "../../util/ApiUtil";

import { toast } from "react-hot-toast";

import { Box, CircularProgress, useMediaQuery } from "@mui/material";

import SearchBar from "../Searchbar/Searchbar";

import TokenExpirationPage from "../../TokenExpirationPage/TokenExpirationPage";

const WeatherData = ({ currentUser }) => {
  const [data, setData] = useState(null);
  const [location, setLocation] = useState("toronto");
  const [inputValue, setInputValue] = useState("");
  const [loading, setLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState("");
  const [tokenExpired, setTokenExpired] = useState(false);
  const [save, setSave] = useState(false);

  const isNonMobileScreens = useMediaQuery("(min-width: 768px)");
  const isNonTabletScreens = useMediaQuery("(min-width: 1024px)");
  const isLargeScreens = useMediaQuery("(min-width: 1440px)"); // Add a new media query for larger screens

  // Set containerWidth based on media query results
  const containerWidth = isLargeScreens
    ? "40%" // Set value for larger screens
    : isNonMobileScreens
    ? "65%" // Set value for non-mobile screens
    : isNonTabletScreens
    ? "80%" // Set value for non-tablet screens
    : "100%"; // Set default value for mobile and tablet screens

  const handleSubmit = (e) => {
    e.preventDefault();

    if (inputValue.trim() !== "") {
      setLocation(inputValue);
      setSave(true);
    } else {
      toast("Please enter a city name");
    }

    setInputValue(""); // Use setInputValue to update state
  };

  useEffect(() => {
    setLoading(true);

    getWeatherDataApi(currentUser.token, location, save)
      .then((res) => {
        setTimeout(() => {
          setData(res.data);
          setLoading(false);
        }, 100);
      })
      .catch((err) => {
        setLoading(false);
        setErrorMsg(err);

        if (err.response.status === 400 || err.response.status === 401) {
          toast(err.response.data.message);
          setTokenExpired(true);
        }
      });
  }, [location, save]);

  useEffect(() => {
    const timer = setTimeout(() => {
      setErrorMsg("");
    }, 3000);
    return () => clearTimeout(timer);
  }, [errorMsg]);

  const loadingBox = (
    <Box
      width="100%"
      height="300px"
      display="flex"
      justifyContent="center"
      alignItems="center"
    >
      <CircularProgress />
    </Box>
  );

  if (tokenExpired) {
    return <TokenExpirationPage />;
  }

  if (!data) return loadingBox;

  return (
    <Box>
      <Box width={containerWidth} margin="15px auto">
        <SearchBar
          onSubmit={handleSubmit}
          inputValue={inputValue}
          setInputValue={setInputValue}
        />
      </Box>
      {/* card */}
      <div className="w-full max-w-[700px] bg-black/20 min-h-[584px] text-purple-900 backdrop-blur-[80px] rounded-[32px] py-12 px-3">
        {loading ? (
          loadingBox
        ) : (
          <div>
            <DisplayWeatherData apiResponse={data} />
          </div>
        )}
      </div>
    </Box>
  );
};

export default WeatherData;