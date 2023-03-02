BasicUpstart2(start)

/* memory pointers */
.const border = $d020
.const bg = $d021
.const irq_flag = $d019
.const irq_ctrl = $d01a
.const irq_addr_msb = $0314
.const irq_addr_lsb = $0315
.const irq_raster = $d012
.const cia1_irq = $dc0d
.const raster_reg = $d011

/* kernel routines */
.const irq_continue = $ea81
.const irq_finish = $ea31

    * = $4000 "Main Program"

start:
    sei

    lda #$7f
    sta cia1_irq // switch off cia-1 interrupts

    and raster_reg
    sta raster_reg // clear vic raster register

    lda #0
    sta irq_raster // start irq1 at raster 0
    lda #<irq1
    sta irq_addr_msb
    lda #>irq1
    sta irq_addr_lsb

    lda #1
    sta irq_ctrl // enable raster interrupts only after setup

    cli
    rts

irq1:
    SetBorderColour(BLUE)
    sta bg
    
    lda #150
    sta irq_raster
    lda #<irq2
    sta irq_addr_msb
    lda #>irq2
    sta irq_addr_lsb

    asl irq_flag
    jmp irq_continue

irq2:
    SetBorderColour(GREEN)
    sta bg
    
    lda #0
    sta irq_raster
    lda #<irq1
    sta irq_addr_msb
    lda #>irq1
    sta irq_addr_lsb

    asl irq_flag
    jmp irq_finish

.macro SetBorderColour(colour) {
    lda #colour
    sta border
}
