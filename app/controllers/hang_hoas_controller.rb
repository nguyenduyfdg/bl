class HangHoasController < ApplicationController

  layout 'store'


  include GioHangHienTai
  before_action :set_gio_hang

  def index
  	if params[:danh_muc].blank?
  		@danh_muc = DanhMuc.first
  		@hang_hoas = @danh_muc.hang_hoas.page(params[:page]).per(8)
  	else
  		@danh_muc_id = DanhMuc.find_by(ten_danh_muc: params[:danh_muc]).id
  		@danh_muc = DanhMuc.find_by(ten_danh_muc: params[:danh_muc])
  		@hang_hoas = HangHoa.where(danh_muc_id: @danh_muc_id).page(params[:page]).per(8)
  	end
  end

  def show
    @chi_tiet_gio_hang = ChiTietGioHang.new
    @hang_hoa = HangHoa.find(params[:id])
    @gia = Gia.find(params[:id])
  end
end
