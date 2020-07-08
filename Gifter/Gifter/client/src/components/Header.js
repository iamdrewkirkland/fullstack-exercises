import React, { useContext } from "react";
import { Link } from "react-router-dom";
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
} from "reactstrap";
import { UserProfileContext } from "../providers/UserProfileProvider";

const Header = () => {
  const { isLoggedIn, logout } = useContext(UserProfileContext);
  return (
    <nav className="navbar navbar-expand navbar-dark bg-info">
      <Link to="/" className="navbar-brand">
        GiFTER
      </Link>
      <ul className="navbar-nav mr-auto">
        {isLoggedIn && (
          <>
            <li className="nav-item">
              <Link to="/" className="nav-link">
                Feed
              </Link>
            </li>
            <li className="nav-item">
              <Link to="/posts/add" className="nav-link">
                New Post
              </Link>
            </li>
            <li>
              <Link
                className="nav-item"
                style={{ cursor: "pointer" }}
                onClick={logout}
              >
                Logout
              </Link>
            </li>
          </>
        )}
        {!isLoggedIn && (
          <>
            <NavItem>
              <NavLink to="/login">Login</NavLink>
            </NavItem>
            <NavItem>
              <NavLink to="/register">Register</NavLink>
            </NavItem>
          </>
        )}
      </ul>
    </nav>
  );
};

export default Header;
