import React, { useState, useEffect } from "react";
import DisplayWeatherData from "../CurrentWeatherData/DisplayWeatherData";
import { getHistoryWeatherDataApi } from "../../util/ApiUtil";

import { CircularProgress, Box, useTheme } from "@mui/material";

import { Pagination } from "swiper";

import { tokens } from "../../theme";

import TokenExpirationPage from "../../TokenExpirationPage/TokenExpirationPage";

import SwiperCore, { Navigation } from "swiper";
import { Swiper, SwiperSlide } from "swiper/react";

import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import NoHistoryWeatherPresent from "./NoHistoryWeatherPresent";

SwiperCore.use([Navigation]);

const HistoryWeatherData = ({ currentUser }) => {
  const [results, setResults] = useState([]);
  const [tokenExpired, setTokenExpired] = useState(false);

  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  const getMyResults = async () => {
    setLoading(true);
    const apiResponse = await getHistoryWeatherDataApi(currentUser.token);

    if (apiResponse && apiResponse.length > 0) {
      setResults(apiResponse);
      setData(true);
      setLoading(false);
    } else if (apiResponse && apiResponse.length === 0) {
      setData(false);
      setLoading(false);
    } else if (apiResponse.response.status === 401) {
      setTokenExpired(true);
      setLoading(false);
    }
  };

  //* colors
  const theme = useTheme();
  const mode = theme.palette.mode;
  const colors = tokens(mode);

  useEffect(() => {
    getMyResults();
  }, []);

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

  const noHistoryBox = (
    <Box>
      <NoHistoryWeatherPresent />
    </Box>
  );

  if (tokenExpired) {
    return <TokenExpirationPage />;
  }

  if (loading) {
    return loadingBox;
  } else if (data === false) {
    return noHistoryBox;
  } else {
    return (
      <Box>
        <Swiper
          modules={[Pagination]}
          spaceBetween={1}
          slidesPerView={1}
          pagination={{ clickable: true }}
          style={{ paddingBottom: "1rem" }}
          navigation={{
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          }}
        >
          {results.map((item, index) => (
            <SwiperSlide key={index}>
              <DisplayWeatherData apiResponse={item} />
            </SwiperSlide>
          ))}
        </Swiper>
        <Box>
          <div
            style={{ color: colors.neutral[200] }}
            className="swiper-button-prev"
          ></div>
          <div
            style={{ color: colors.neutral[200] }}
            className="swiper-button-next"
          ></div>
        </Box>
      </Box>
    );
  }
};

export default HistoryWeatherData;