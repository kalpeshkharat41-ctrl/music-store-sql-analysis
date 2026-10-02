# 🎵 Music Store Relational Database & Business Analysis (SQL)

An end-to-end relational database project analyzing operational, transactional, and customer data for a digital music store. This project demonstrates database schema design (DDL), sample dataset population (DML), and solving real-world business problems using basic to advanced SQL queries.

---

## 📌 Table of Contents
- [Project Overview](#-project-overview)
- [Database Schema](#-database-schema)
- [Project Structure](#-project-structure)
- [Key Business Questions & Analytical Focus](#-key-business-questions--analytical-focus)
  - [1. Operational & Sales Highlights (Easy)](#1-operational--sales-highlights-easy)
  - [2. Customer & Genre Analysis (Moderate)](#2-customer--genre-analysis-moderate)
  - [3. Advanced Insights & Regional Metrics (Advanced)](#3-advanced-insights--regional-metrics-advanced)
- [How to Set Up and Run](#-how-to-set-up-and-run)
- [Tools Used](#-tools-used)

---

## 📖 Project Overview
The primary goal of this project is to analyze a digital music store's database to extract actionable insights regarding:
- **Employee Management:** Identifying store hierarchy and senior personnel.
- **Revenue Drivers:** Uncovering top-performing cities, high-value customers, and invoice metrics for promotional events.
- **Product Strategy:** Tracking rock music popularity, top-performing artists, and track length distribution.
- **Regional Preferences:** Mapping customer purchasing trends and top music genres across different countries using advanced window functions.

---

## 🗄️ Database Schema

The database consists of **11 interconnected tables**:
- **`employee`**: Tracks employee roles, reporting structures, and hire dates.
- **`customer`**: Stores customer demographic information and assigned support reps.
- **`artist` & `album`**: Maps artists to their respective albums.
- **`genre` & `media_type`**: Categorizes tracks by music genre and file format.
- **`track`**: Contains track metadata (duration, price, composer, album link).
- **`playlist` & `playlist_track`**: Junction tables for playlist associations.
- **`invoice` & `invoice_line`**: Records transaction totals, billing addresses, and line-item track details.

---

## 📂 Project Structure

```text
├── schema.sql     # DDL: Table creation, primary keys, and foreign key constraints
├── data.sql       # DML: Seed data insertion scripts for populating tables
├── queries.sql    # Analytical SQL queries (Easy, Moderate, Advanced levels)
└── README.md      # Comprehensive project documentation