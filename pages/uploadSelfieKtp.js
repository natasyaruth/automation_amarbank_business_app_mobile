const { I } = inject();

module.exports = {

    buttons: {
      directToTakePhoto: "~",
      takePhoto: "~buttonTakePhoto",
      reTakePhoto: "~buttonRetake",
      upload: "~buttonUpload",
    },

    directToPhoto(){
      I.waitForElement(this.buttons.directToTakePhoto, 10);
      I.click(this.buttons.directToTakePhoto);
    },

    takePhoto(){
      I.waitForElement(this.buttons.takePhoto, 10);
      I.click(this.buttons.takePhoto);
    },

    reTakePhoto(){
      I.waitForElement(this.buttons.reTakePhoto, 10);
      I.click(this.buttons.reTakePhoto);
    },

    submitPhotoSelfieWithKTP(){
      I.waitForElement(this.buttons.upload, 10);
      I.click(this.buttons.upload);
    }
  
}
