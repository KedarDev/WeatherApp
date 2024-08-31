import { Box, IconButton, InputBase, useTheme } from "@mui/material";

import { useCallback } from "react";
import { tokens } from "../../theme";

import { FiSearch } from "react-icons/fi";

const SearchBar = ({ onSubmit, inputValue, setInputValue }) => {
  /** For colors */
  const theme = useTheme();
  const mode = theme.palette.mode;
  const colors = tokens(mode);

  // Use useCallback to memoize the handleChange function
  const handleChange = useCallback(
    (e) => {
      setInputValue(e.target.value);
    },
    [setInputValue] // Include setInputValue in the dependency array
  );

  return (
    <form
      sx={{
        position: "relative",
        display: "flex",
        justifyContent: "center",
      }}
      onSubmit={onSubmit}
    >
      <Box
        display="flex"
        justifyContent="space-between"
        alignItems="center"
        backgroundColor={colors.neutral[300]}
        borderRadius="20px"
        gap="3rem"
        padding="0.75rem 0.75rem 0.75rem 1.5rem"
        sx={{
          ":focus": {
            border: `2px solid ${colors.neutral[200]}`,
          },
          boxShadow:
            mode === "dark" &&
            "0px 10px 13px -7px #000000, 5px 5px 15px 5px rgba(0, 0, 0, 0)",
        }}
      >
        <InputBase
          value={inputValue}
          onChange={handleChange}
          placeholder="Search a city"
          autoFocus
        />
        <IconButton
          sx={{ backgroundColor: colors.primary[500], fontSize: "16px" }}
          onClick={onSubmit}
        >
          <FiSearch color={colors.white[100]} />
        </IconButton>
      </Box>
    </form>
  );
};

export default SearchBar;