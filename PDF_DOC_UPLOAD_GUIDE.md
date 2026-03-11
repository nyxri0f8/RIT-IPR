# PDF & Word Document Upload Guide

## 🎉 New Feature: Multi-Format Document Upload

Your RIT IPR Portal now supports uploading PDF and Word documents in addition to images!

## 📄 Supported File Formats

### 1. Images (with OCR)
- **PNG** - Portable Network Graphics
- **JPG/JPEG** - Joint Photographic Experts Group
- **GIF** - Graphics Interchange Format
- **BMP** - Bitmap Image File

### 2. PDF Documents
- **PDF** - Portable Document Format
- Direct text extraction (no OCR needed)
- Multi-page support
- Fast and accurate

### 3. Word Documents
- **DOC** - Microsoft Word 97-2003
- **DOCX** - Microsoft Word 2007+
- Direct text extraction
- Preserves formatting

## 🚀 How It Works

### For Images (PNG, JPG, etc.)
1. Upload your image
2. **OCR (Optical Character Recognition)** scans the image
3. Text is extracted from the image
4. Auto-fills the form fields

### For PDF Files
1. Upload your PDF
2. **PDF.js** extracts text directly
3. Works with all pages
4. Much faster than OCR
5. Auto-fills the form fields

### For Word Documents (DOC/DOCX)
1. Upload your Word file
2. **Mammoth.js** extracts text
3. Preserves document structure
4. Auto-fills the form fields

## 📤 How to Upload

### Step-by-Step Guide

1. **Go to New Patent**
   - Click "New Patent" from dashboard or sidebar
   - You'll see Step 1: Submit Your Invention

2. **Find Upload Zone**
   - Look for the "Upload Document (Optional)" section
   - It's at the top of the form

3. **Click to Upload**
   - Click the upload zone
   - Or drag and drop your file

4. **Select Your File**
   - Choose from:
     - Image files (PNG, JPG, GIF, BMP)
     - PDF documents
     - Word documents (DOC, DOCX)

5. **Wait for Processing**
   - Progress bar shows extraction status
   - Images: OCR processing (slower)
   - PDF/Word: Direct extraction (faster)

6. **Review Extracted Text**
   - Preview shows first 300 characters
   - Check if extraction is accurate

7. **Edit if Needed**
   - Form fields are auto-filled
   - Edit any incorrect information
   - Add more details manually

8. **Continue**
   - Click "Next: Technical Details"
   - Complete the rest of the form

## 💡 Best Practices

### For Best Results

#### Images
- ✅ Use high-resolution images
- ✅ Ensure good lighting
- ✅ Clear, readable text
- ✅ Avoid handwritten text
- ✅ Straight, not tilted
- ❌ Avoid blurry images
- ❌ Avoid low contrast

#### PDF Files
- ✅ Text-based PDFs work best
- ✅ Multi-page PDFs supported
- ✅ Searchable PDFs ideal
- ⚠️ Scanned PDFs may need OCR
- ❌ Password-protected PDFs not supported

#### Word Documents
- ✅ Both DOC and DOCX work
- ✅ Plain text extracts best
- ✅ Tables and lists supported
- ⚠️ Complex formatting may be simplified
- ⚠️ Images in Word are ignored

## 🎯 What Gets Extracted

### Auto-Fill Behavior

**Title Field**:
- First significant line of text
- Usually the document heading
- Can be edited after extraction

**Problem Description**:
- Full text from document
- All pages/content included
- Preserves paragraph structure

**Other Fields**:
- Not auto-filled (yet)
- You can copy from extracted text
- Or type manually

## ⚡ Processing Speed

### Typical Processing Times

**Images (OCR)**:
- Small image (< 1MB): 5-10 seconds
- Medium image (1-3MB): 10-20 seconds
- Large image (3-10MB): 20-40 seconds

**PDF Files**:
- Single page: 1-2 seconds
- Multi-page (5-10 pages): 2-5 seconds
- Large PDF (20+ pages): 5-10 seconds

**Word Documents**:
- Small doc (< 1MB): 1-2 seconds
- Medium doc (1-5MB): 2-5 seconds
- Large doc (5-10MB): 5-10 seconds

## 🔧 Technical Details

### Libraries Used

**For Images**:
- **Tesseract.js** - OCR engine
- Recognizes text in images
- Supports multiple languages

**For PDFs**:
- **PDF.js** - Mozilla's PDF library
- Direct text extraction
- No OCR needed

**For Word Documents**:
- **Mammoth.js** - Word document parser
- Converts DOC/DOCX to text
- Preserves structure

### File Size Limits

- **Images**: Up to 10MB
- **PDF**: Up to 20MB
- **Word**: Up to 10MB

### Browser Compatibility

- ✅ Chrome/Edge (Recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Opera
- ⚠️ Internet Explorer (Not supported)

## 🚫 Troubleshooting

### Problem: Upload Not Working

**Solution**:
- Check file format is supported
- Ensure file size is within limits
- Try a different browser
- Refresh the page

### Problem: Text Not Extracted

**Solution**:
- For images: Ensure text is clear and readable
- For PDFs: Check if PDF is text-based (not scanned)
- For Word: Ensure file is not corrupted
- Try uploading a different file

### Problem: Incorrect Text Extracted

**Solution**:
- For images: Use higher resolution image
- For PDFs: Check if PDF has selectable text
- Edit the extracted text manually
- Type the correct information

### Problem: Processing Takes Too Long

**Solution**:
- Large files take longer
- Images with OCR are slower
- Try a smaller file
- Use PDF/Word instead of images
- Be patient - don't refresh

### Problem: File Upload Button Not Responding

**Solution**:
- Check if another upload is in progress
- Refresh the page
- Clear browser cache
- Try a different browser

## 📊 Comparison: Which Format to Use?

### Use Images When:
- ✅ You have a photo of a document
- ✅ You have a scanned document
- ✅ You have a screenshot
- ⚠️ Slower processing (OCR)

### Use PDF When:
- ✅ You have a digital PDF
- ✅ You want fast extraction
- ✅ You have multi-page documents
- ✅ Best for official documents

### Use Word When:
- ✅ You have a DOC/DOCX file
- ✅ You want to preserve structure
- ✅ You have formatted text
- ✅ Fast and accurate

## 🎓 Examples

### Example 1: Uploading a PDF Patent Draft

1. You have a PDF with your invention details
2. Click upload zone
3. Select your PDF file
4. Wait 2-3 seconds
5. Text is extracted from all pages
6. Title and description are auto-filled
7. Review and edit if needed
8. Continue with the form

### Example 2: Uploading a Word Document

1. You wrote your invention in Word
2. Click upload zone
3. Select your DOCX file
4. Wait 1-2 seconds
5. Text is extracted
6. Form fields are populated
7. Add technical details
8. Proceed to analysis

### Example 3: Uploading a Photo

1. You took a photo of your notes
2. Click upload zone
3. Select the image
4. Wait 10-15 seconds for OCR
5. Review extracted text
6. Correct any OCR errors
7. Complete the form

## 💾 Data Privacy

### Your Files Are Safe

- ✅ Files processed locally in browser
- ✅ No files uploaded to server
- ✅ Text extraction happens on your device
- ✅ Files not stored anywhere
- ✅ Complete privacy

### What Happens to Your File?

1. You select a file
2. File is read in browser memory
3. Text is extracted locally
4. File is discarded after extraction
5. Only extracted text is kept temporarily
6. Text is used to fill form fields
7. No permanent storage of file

## 🆕 Future Enhancements

Planned features:
- Support for more file formats
- Better OCR accuracy
- Multi-file upload
- Batch processing
- AI-powered text parsing
- Automatic field detection
- Language support

## ❓ FAQ

**Q: Can I upload multiple files?**
A: Not yet - one file at a time for now.

**Q: What if my PDF is scanned?**
A: Scanned PDFs may not extract text. Use image upload with OCR instead.

**Q: Does it work offline?**
A: Yes! All processing happens in your browser.

**Q: Is there a file size limit?**
A: Yes - 10MB for images/Word, 20MB for PDFs.

**Q: Can I upload password-protected files?**
A: No - remove password protection first.

**Q: What languages are supported?**
A: Currently English only for OCR.

**Q: Can I upload from my phone?**
A: Yes! Works on mobile browsers.

**Q: What if extraction fails?**
A: You can always type manually.

## 🎉 Enjoy the New Feature!

Upload your documents and let the AI do the work! Save time and effort with automatic text extraction.

---

**Need Help?**
- Check `FEATURES.md` for all features
- See `HOW_TO_USE_HISTORY.md` for history guide
- Read `USER_GUIDE.md` for complete documentation

**Questions?**
Contact your RIT IPR administrator or IT support.
