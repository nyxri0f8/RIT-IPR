# RIT IPR Portal - User Guide

## Getting Started

### 1. Create Your Account

1. Visit the RIT IPR Portal
2. Click "Create Account" on the login page
3. Fill in your details:
   - **Full Name**: Your complete name
   - **Email**: Your institutional or personal email
   - **Institution**: Rajalakshmi Institute of Technology (or your institution)
   - **Department**: Your department (e.g., Computer Science)
   - **Password**: Choose a strong password (min 6 characters)
   - **Confirm Password**: Re-enter your password

4. **(Optional)** Add API Keys:
   - **Claude API Key**: Get from [Anthropic Console](https://console.anthropic.com/)
   - **Gemini API Key**: Get from [Google AI Studio](https://aistudio.google.com/apikey)
   
5. Click "Create Account"
6. You'll be automatically logged in

### 2. Login to Existing Account

1. Enter your email and password
2. Click "Login"
3. You'll be redirected to the patent filing form

**Note**: Your session lasts 30 days. You'll stay logged in unless you manually logout or clear cookies.

## Filing a Patent

### Step 1: Basic Information

1. **Invention Title**: Give your invention a clear, descriptive name
   - Example: "IoT-Based Smart Vehicle Anti-Theft System"

2. **Problem It Solves**: Describe the problem your invention addresses
   - Be specific about the pain points
   - Explain why existing solutions are inadequate

3. **Target Industry**: Select from dropdown
   - IoT, Healthcare, Agriculture, Education, etc.

4. Click "Next: Technical Details →"

### Step 2: Technical Details

1. **Components Used**: List all hardware/software components
   - Example: "ESP32, Ultrasonic Sensor, GSM SIM800L, GPS NEO-6M"
   - Separate with commas

2. **How It Works**: Explain the working principle
   - Step-by-step process
   - How components interact
   - Data flow

3. **What Makes It Unique**: Highlight novel features
   - Compare with existing solutions
   - Explain your innovation
   - Technical advantages

4. Click "Next: Review →"

### Step 3: Review & Analyze

1. Review all entered information
2. Make edits if needed (click "← Edit")
3. **Select AI Model**:
   - **Claude Sonnet 4**: No API key needed (uses direct browser access)
   - **Gemini 2.0 Flash**: Requires API key (enter if not saved in profile)

4. Click "⚡ Analyze with [AI Model]"

### Step 4: View Results

After AI analysis (takes 10-30 seconds), you'll see:

#### Analysis Scores
- **Innovation Score**: How innovative your invention is (0-100)
- **Novelty Score**: How novel compared to prior art (0-100)
- **Patent Readiness**: How ready for filing (0-100)

#### Detailed Analysis
- **Novelty Analysis**: Why your invention is novel
- **Similar Patents**: Prior art comparison
- **Patent Abstract**: AI-generated abstract
- **Technical Description**: Detailed technical write-up
- **Patent Claims**: Numbered claims for filing
- **IPC Codes**: International Patent Classification codes
- **Grant Probability**: Likelihood of patent approval
- **Next Steps**: Recommended actions

#### Actions Available
- **📋 Copy Report**: Copy full text report to clipboard
- **📄 Download PDF**: Generate professional PDF report
- **📄 Generate IPO Forms**: Create Indian Patent Office forms

## Downloading PDF Report

1. Click "📄 Download PDF" button
2. PDF will be automatically downloaded with filename:
   - Format: `RIT_IPR_[InventionTitle]_[Date].pdf`
   - Example: `RIT_IPR_Smart_Vehicle_System_2026-03-11.pdf`

### PDF Contents
- Professional header with RIT branding
- Invention details and filing information
- Analysis scores in table format
- Inventors information
- Complete abstract
- Technical description
- All patent claims
- IPC classification codes
- Page numbers and footer

## Generating IPO Forms

1. Click "📄 Generate IPO Forms →"
2. Fill in applicant details:
   - Applicant name and address
   - Institution details
   - Inventor information (add multiple inventors)
   - Patent agent details (if applicable)
   - Filing office selection

3. Select forms to generate:
   - ✅ Form 1: Application for Grant of Patent (Required)
   - ✅ Form 2: Complete Specification (Required)
   - ✅ Form 3: Statement & Undertaking (Required)
   - ✅ Form 5: Declaration of Inventorship (Required)
   - ☐ Form 26: Patent Agent Authorization (Optional)
   - ☐ NOC-I: Institutional NOC (Optional)
   - ☐ NOC-S: Student/Author NOC (Optional)

4. Click "Generate Forms"
5. Download complete package

## Managing Your Account

### Viewing Profile
- Your name appears in the top-right corner when logged in
- Shows: "Welcome, [Your Name]"

### Logging Out
1. Click "Logout" button in top-right
2. You'll be redirected to login page
3. Your data remains saved in cookies

### Updating API Keys
Currently, API keys can only be set during registration. To update:
1. Logout
2. Clear browser cookies
3. Register again with new keys

*Future update will add profile editing*

## Tips for Best Results

### Writing Good Descriptions

1. **Be Specific**: Avoid vague terms
   - ❌ "It uses sensors"
   - ✅ "It uses HC-SR04 ultrasonic sensors for distance measurement"

2. **Explain the Innovation**: Focus on what's new
   - ❌ "It's better than existing systems"
   - ✅ "Unlike existing systems that use GPS only, our system combines GPS with ultrasonic sensors for indoor tracking"

3. **Technical Details Matter**: More detail = better analysis
   - Include component specifications
   - Explain algorithms used
   - Describe data processing methods

### Choosing AI Model

**Use Claude if:**
- You don't have API keys
- You want quick results
- You're doing initial exploration

**Use Gemini if:**
- You have a Gemini API key
- You want alternative analysis
- Claude is rate-limited

## Troubleshooting

### Can't Login
- Check email and password spelling
- Ensure you've registered first
- Try clearing cookies and re-registering

### Analysis Failed
- Check internet connection
- Verify API key (if using Gemini)
- Try different AI model
- Ensure all form fields are filled

### PDF Not Downloading
- Check browser download settings
- Allow pop-ups for the site
- Try different browser
- Check available disk space

### Forms Not Generating
- Ensure all required fields are filled
- Check inventor information is complete
- Verify institution details

## Data Privacy

### What's Stored
- Your account information (name, email, institution)
- API keys (if provided)
- All stored in browser cookies only

### What's NOT Stored
- Your invention details
- Analysis results
- Generated forms
- These are temporary and cleared on logout/refresh

### Clearing Your Data
To completely remove your data:
1. Logout from the portal
2. Clear browser cookies for the site
3. Or use browser's "Clear browsing data" feature

## Support

For issues or questions:
- Contact: RIT IPR Cell
- Email: ipr@ritchennai.edu.in
- Visit: Innovation Cell, RIT Campus

## Best Practices

1. **Save Your Work**: Copy important text before closing browser
2. **Download PDFs**: Save analysis results as PDF for records
3. **Multiple Drafts**: Try different descriptions to improve scores
4. **Review Carefully**: Check all details before generating forms
5. **Keep API Keys Safe**: Don't share your API keys with others

---

**Happy Inventing! 🚀**

*Rajalakshmi Institute of Technology*  
*Believe in the Possibilities*
