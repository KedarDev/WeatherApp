import React from 'react'
import { Box, Typography, useTheme, useMediaQuery } from '@mui/material'
import { tokens } from '../theme';


const TokenExpirationPage = () => {

    //* colors
  const theme = useTheme();
  const mode = theme.palette.mode;
  const colors = tokens(mode);

  // To handle responsiveness
  const isNonMobileScreens = useMediaQuery("(min-width: 768px)");
  const isNonTabletScreens = useMediaQuery("(min-width: 1024px)");
  const isLargeScreens = useMediaQuery("(min-width: 1440px)"); // Add a new media query for larger screens

  // Set containerWidth based on media query results
  const containerWidth = isLargeScreens
    ? "20%" // Set value for larger screens
    : isNonMobileScreens
    ? "35%" // Set value for non-mobile screens
    : isNonTabletScreens
    ? "30%" // Set value for non-tablet screens
    : "100%"; // Set default value for mobile and tablet screens

  return (
    <Box display="flex" justifyContent="center" alignItems="center" minHeight={"100vh" } p={"5"} minWidth={"100wh"}
     >
      <Box width={containerWidth} textAlign="center" p={"2rem"} borderRadius="20px" sx={{backgroundColor:colors.neutral[300]}}> 
        <Typography variant='h3'>Your session token has expired</Typography>
        <Box display="flex" justifyContent="center">
          <svg
            version="1.0"
            xmlns="http://www.w3.org/2000/svg"
            width="100"
            height="100"
          >
            <path
              fill="#FFCA28"
              d="M60 36.667H47.776L40 60h10l-6.667 20 19.999-26.667h-10z"
            />
            <path
              fill="#29B6F6"
              d="M33.333 40c0-11.045 8.955-20 20-20 7.702 0 13.991 5.854 14.832 13.333h5.168c5.515 0 10 4.485 10 10s-4.485 10-10 10H70V60h3.332C82.539 60 90 52.539 90 43.333s-7.461-16.667-16.668-16.667c-3.262-7.829-10.985-13.333-20-13.333-12.419 0-22.827 8.506-25.791 20h-4.208C15.971 33.333 10 39.302 10 46.667 10 54.029 15.971 60 23.333 60h10v-6.667h-10a6.675 6.675 0 0 1-6.667-6.667 6.675 6.675 0 0 1 6.667-6.667l10 .001zM14.445 66.667 10 80h7.026l4.446-13.333zM76.308 66.667 71.861 80h7.025l4.446-13.333zM26.305 73.333l-4.446 13.334h7.029l4.445-13.334zM59.643 73.333l-4.448 13.334h7.03l4.441-13.334z"
            />
          </svg>

          
        </Box>
        <Typography variant='p'>You will be re-directed to the login page on refresh</Typography>
        <br/>
      </Box>
    </Box>
  )
}

export default TokenExpirationPage